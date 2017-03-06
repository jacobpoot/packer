# packer
SET ARM_RESOURCE_GROUP=image-ubuntu
SET ARM_STORAGE_ACCOUNT=jacobstorimages
SET ARM_SUBSCRIPTION_ID=8c6f9e0e-915e-4898-b190-8494072467b2

#packer Azure AD application

ServicePrincipalNames : {e9a0bd0d-ced7-4b20-88fd-145c706e9ee0, http://azuregek.nl/packer}
ApplicationId         : e9a0bd0d-ced7-4b20-88fd-145c706e9ee0
DisplayName           : packer
Id                    : 3c5c7778-7f0b-4f82-ab5f-12d800685d29
Type                  : ServicePrincipal


+ **Key   : ClientID**
+ Value : e9a0bd0d-ced7-4b20-88fd-145c706e9ee0
+ Name  : ClientID

+ **Key   : resource_group_name**
+ Value : packer
+ Name  : resource_group_name

+ **Key   : storage_account**
* Value : packer322585788
* Name  : storage_account

+ **Key   : client_secret**
+ Value : 
+ Name  : client_secret

+ **Key   : SubscriptionID**
+ Value : 8c6f9e0e-915e-4898-b190-8494072467b2
+ Name  : SubscriptionID

+ **Key   : TenantID**
+ Value : d017007d-9b9c-44cc-84d8-95533b70f026
+ Name  : TenantID


Key   : object_id
Value : 3c5c7778-7f0b-4f82-ab5f-12d800685d29
Name  : object_id
