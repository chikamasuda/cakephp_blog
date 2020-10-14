cakephpの初期設定の流れ

auto_cakephp内のファイルをすべて作業フォルダにコピーしてください。

sh unzip_cakephp.sh
を実行し、zipファイルを解凍後、名前をcakephpにします。

sh vagrant_box.sh
を実行し、vagrantを立ち上げを行います。

vagrant ssh
を実行し、vagrantにログインします。

sh /vagrant/auto_cakephp.sh
を実行し、それぞれのファイルの中身を更新します。

exit
を実行し、vagrantからlogoutします。

chmod -R 777 cakephp/app/tmp
vagrant reload
を実行し、権限の設定やvagrantのreloadを行います。

vagrant ssh
sh /vagrant/cakephp_restart.sh
を実行し、サービズの再開を行う。（これは初期設定に限らず便利。）

初期設定完了。





# CakePHP_blog
