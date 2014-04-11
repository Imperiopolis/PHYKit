# PHYKit #

__Currently this is incomplete and should not be used in production!__ 

The PHYKit project was started last year right after WWDC, but our time to dedicate to the project has dwindled so we decided to push it to GitHub in case our efforts benefit anyone else.

PHYKit aims to be an API compatible implementation of UIKitDynamics for AppKit (OS X). The dynamics use Box2d under the hood, in the same fashion as Apple does.

PHYKit currently supports gravity, collisions, and pushing. Not all functionality is implemented for these dynamic types, for example collisions don't support the callback on when a collision has occurred.

Attachments and springs are a work in progress.