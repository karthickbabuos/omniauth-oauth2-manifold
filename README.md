# omniauth-oauth2-manifold

Omniauth-oauth2-manifold
Description
Stategic framework based gem for all oauth2 integrations

Problems in having provider gems for integration
1. Since every gem is dependent on Omniauth-oauth2, product has to maintain different version of oauth2 that the gem expects.
2. Dependency issues with other provider gems when single gem is upgraded.
3. Update required whenever vulnerablity in any areas / update is relesaed
4. Responses cannot be altered. Actual authentication response paramter alone will be received. Subsequent API's are required to fetch those information. Eg. Hosted domain information from Google can be altered.
5. State parameters can be introduced.
6. Can control saving session information after authentication. (through :provder_ignores_state parameter)

Eg. With the recent release of Google omniauth oauth2 gem jwt token validation and image details exclusion is done. This can be controlled by making these parameters as optional as shown below.

option :skip_image_info, true
      option :skip_jwt, false
      option :jwt_leeway, 60

The above mentioned problems can be easily controlled through this architecture.

Simply introduce a .rb file for integrations under omniauth/strategies directory.

Pros

1. Flexible with the customizations in various aspects.
2. Maintainablity becomes easier. (Maintenance required only we you alter response parameters based on api response)
