Client Presenter
======================


**:authorize_client**

    before_filter :authorize_client
Prevents non administrators from accessing client data they should not have access to.

**:authorize_admin**

    before_filter :authorize_admin
Restricts access unless current user is signed in and listed as an administrator.

**:authorize**

    before_filter :authorize
Restricts access unless current user is signed in.


Workflow Notes
--------------
* `bundle` to install dependencies
* `rails server` if using the built in rails server
* `rails console` interactive console

Links
-----
* <http://clientpresenter.dev>
