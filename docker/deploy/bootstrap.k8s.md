# Setting up testing cluster


## Set profile for awscli that can do the following things

        export AWS_PROFILE=openpath

## Make a cluster

Takes 10-15 minutes

<pre>
eksctl create cluster \
  --name openpath \
  --version 1.14 \
  --region us-east-1 \
  --nodegroup-name frontend \
  --node-type t3.small \
  --nodes 2 \
  --nodes-min 1 \
  --nodes-max 4 \
  --ssh-access \
  --ssh-public-key blackman \
  --managed
</pre>

check on issues building with this or go to the cloudformation page in AWS

        eksctl utils describe-stacks --region=us-east-1 --cluster=openpath

## Enable cluster logging

        eksctl utils update-cluster-logging --region=us-east-1 --cluster=openpath

## See the nodes with standard k8s tools.

The create cluster command should have made this next command work

        kubectl get nodes

If the kubectl command didn't work see
[this](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

## WIP: Run as yet unwritten ansible against these servers. Like pam-sudo, per-user logins instead of ubuntu, etc.

## Tag all subnets so k8s knows which it can use for load balancing

https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html

All
        kubernetes.io/cluster/openpath=shared

external
        kubernetes.io/role/elb=1

internal
        kubernetes.io/role/internal-elb=1


# Make oidc provider

fuzzy why we need this

<pre>
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster openpath \
    --approve
</pre>



# Make policy so ingress controller can talk to AWS api
aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document k8s/ingress.policy.json

# Make a service account

fuzzy why we need this. It think it's just setting permissions on what the
ingree controllers can do.

Create a Kubernetes service account named alb-ingress-controller in the kube-system namespace, a cluster role,
and a cluster role binding for the ALB Ingress Controller to use with the
following command:

       kubectl apply -f k8s/rbac-role.yml

# another step
Create an IAM role for the ALB ingress controller and attach the role to the
service account created in the previous step. If you didn't create your cluster
with eksctl, then use the instructions on the AWS Management Console or AWS CLI
tabs.

<pre>
eksctl create iamserviceaccount \
    --region us-east-1 \
    --name alb-ingress-controller \
    --namespace kube-system \
    --cluster openpath \
    --attach-policy-arn arn:aws:iam::111122223333:policy/ALBIngressControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve
</pre>

# Deploy the ALB Ingress Controller

kubectl apply -f k8s/alb-ingress-controller.yml

# See it

kubectl get pods -n kube-system


Now wasn't that easy?


