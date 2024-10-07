#!/bin/bash

# Set variables
NAMESPACE="aws-application-networking-system"
CLUSTER_NAME="portfolio-eks-cluster"
AWS_REGION="ap-south-1"

# Export necessary variables for AWS CLI
export AWS_REGION=$AWS_REGION
export CLUSTER_NAME=$CLUSTER_NAME

# Function to delete resources
delete_k8s_resources() {
    echo "Deleting HTTPRoutes..."
    kubectl delete httproutes --all --namespace=$NAMESPACE

    echo "Deleting Gateways..."
    kubectl delete gateways --all --namespace=$NAMESPACE

    echo "Deleting GatewayClasses..."
    kubectl delete gatewayclasses --all --namespace=$NAMESPACE

    echo "Deleting Namespace..."
    kubectl delete namespace $NAMESPACE
}

# Delete AWS VPC Lattice associations and resources
delete_vpc_lattice_resources() {
    echo "Fetching Service Network ID..."
    SERVICE_NETWORK_ID=$(aws vpc-lattice list-service-networks --query "items[?name=='portfolio-gateway'].id" --output text)

    if [ -n "$SERVICE_NETWORK_ID" ]; then
        echo "Deleting Service Network VPC Association..."
        CLUSTER_VPC_ID=$(aws eks describe-cluster --name $CLUSTER_NAME | jq -r .cluster.resourcesVpcConfig.vpcId)
        aws vpc-lattice delete-service-network-vpc-association --service-network-identifier $SERVICE_NETWORK_ID --vpc-identifier $CLUSTER_VPC_ID

        echo "Deleting Service Network..."
        aws vpc-lattice delete-service-network --id $SERVICE_NETWORK_ID
    else
        echo "No Service Network found to delete."
    fi
}

# Main function to trigger the cleanup
main() {
    delete_k8s_resources
    delete_vpc_lattice_resources
    echo "Cleanup completed!"
}

# Execute the main function
main

