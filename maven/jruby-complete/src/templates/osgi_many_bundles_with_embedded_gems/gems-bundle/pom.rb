#-*- mode: ruby -*-

gemfile

model.repositories.clear
repository( :url => 'https://otto.takari.io/content/repositories/rubygems/maven/releases', :id => 'rubygems-releases' )

id 'org.jruby.osgi:gems-bundle', '1.0'

packaging 'bundle'

# default versions will be overwritten by pom.rb from root directory
properties( 'jruby.plugins.version' => '1.0.10',
            # needed bundle plugin
            'polyglot.dump.pom' => 'pom.xml' )

jruby_plugin! :gem, :includeRubygemsInResources => true, :jrubyVersion => '9.0.0.0'

plugin( 'org.apache.felix:maven-bundle-plugin', '2.4.0',
        :instructions => {
          'Export-Package' => 'org.jruby.osgi.gems',
          'Include-Resource' => '{maven-resources}'
        } ) do
  # TODO fix DSL
  @current.extensions = true
end
