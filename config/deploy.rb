application = "bambooine"
repository = 'git@github.com:freireag/bambooine.git'
hosts = ['ssdeploy']

path = '/home/rails'                                # default /var/local/apps
user = 'rails'                              # default deploy
# branch = 'production'                        # default master
#sudo = true                                  # default false
#cache_dirs = ['public/cache', 'tmp/cache']   # default ['public/cache']
skip_steps = ['install_gems'] # default [] , 'clear_cache'

