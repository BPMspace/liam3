import Route from './router/Route.js';
import Router from './router/Router.js';

// Views
import readView from './views/read.js';
import workflowView from './views/workflow.js';

// The Order is important!!
const routes = [
  new Route('workflow', '/:table/workflow', workflowView),
  new Route('read', '/:table', readView),
];

//=== Init Application
document.addEventListener('DOMContentLoaded', () => {
  // Load Configuration
  DB.loadConfig(config => {
    //==========================================================
    // Set actual User
    const router = new Router(routes, document.getElementById('app'));
    const elemUser = document.getElementById('username');
    //elemUser.innerText = config.user.firstname + ' ' + config.user.lastname;
    elemUser.setAttribute('title', 'UserID: ' + config.user.liam3_user_id);
    // Set Table Links
    Object.keys(config.tables).forEach(tname => {
      // Render only if in Menu
        var render_state = true;
        if (tname.indexOf('state') !== -1) {
            if (config.user.liam3_user_role_id != 1) {
                render_state = false;
            }
        }
          if (config.tables[tname].in_menu && render_state) {
              //--> Create Link
              const tmpBtn = document.createElement('a');
              document.getElementById('sidebar-links').appendChild(tmpBtn);
              tmpBtn.setAttribute('class', 'list-group-item list-group-item-action link-'+tname);
              tmpBtn.setAttribute('href', '#/' + tname);
              tmpBtn.addEventListener('click', () => {
                  if (tmpBtn.getAttribute('href') === window.location.hash)
              router.navigate(window.location.hash.substr(1));
          })
              tmpBtn.innerHTML = config.tables[tname].table_icon + `<span class="ml-2">${config.tables[tname].table_alias}</span>`;
          }
    });
    //==========================================================
    // Happens after init
    window.addEventListener('hashchange', e => {
      router.navigate(e.target.location.hash.substr(1));
    });
    //------------------------------- PING (token refresh)
    setInterval(() => {
      DB.request('ping', {}, ()=>{});
    }, 60000); // 1min
  });
});