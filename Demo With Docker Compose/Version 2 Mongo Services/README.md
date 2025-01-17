<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Gitlab: https://gitlab.com/DanielBenjaminPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Mongo Service Version 2 Docker Compose***

- *Si eliminas este atributo, el mensaje de advertencia desaparecerá y evitarás posibles confusiones relacionadas con su uso. Esto es porque Docker Compose ahora determina automáticamente cómo manejar el fichero sin necesidad de especificar una versión explícita.*

## **Mensaje de advertencia**

```bash
WARN[0000] /home/d4nitrix13/Escritorio/Repository/Docker Compose/Demo With Docker Compose/mongo-services.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
```

### ***Explicación***

1. **Motivo de la advertencia:**
   - *Docker Compose está simplificando su manejo de configuraciones.*
   - *En versiones modernas (v2.x y v3.x), el atributo `version` ya no es requerido, ya que se busca reducir redundancias y simplificar la experiencia del usuario.*

2. **Impacto de mantener `version`:**
   - *Aunque no afecta el funcionamiento, genera advertencias en la terminal, lo cual puede llevar a confusión, especialmente en proyectos nuevos o colaborativos.*

3. **Cómo resolverlo:**
   - *Elimina la línea `version: "x.x"` de tu fichero `mongo-services.yaml`.*

4. **Beneficio:**
   - *El fichero de configuración queda más limpio y alineado con las prácticas actuales de Docker Compose.*
   - *Elimina advertencias innecesarias, mejorando la claridad del flujo de trabajo.*

### **Ejemplo antes y después**

**Antes (con `version`):**

```yaml
version: "3.8"  # Obsoleto, Genera Advertencias
services:
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
  mongo-express:
    image: mongo-express
    ports:
      - 8081:8081
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret
      - ME_CONFIG_MONGODB_SERVER=mongo-demo
      - ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/
      - ME_CONFIG_MONGODB_ENABLE_ADMIN=true
      - ME_CONFIG_OPTIONS_EDITORTHEME=material-darker
      - ME_CONFIG_REQUEST_SIZE=100kb
      - ME_CONFIG_SITE_BASEURL=/
      - ME_CONFIG_SITE_COOKIESECRET=cookiesecret
      - ME_CONFIG_SITE_SESSIONSECRET=sessionsecret
      - ME_CONFIG_SITE_SSL_ENABLED=false
      - ME_CONFIG_MONGODB_AUTH_USERNAME=admin
      - ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
      - ME_CONFIG_MONGODB_PORT=27017
```

**Después (sin `version`):**

```yaml
services:
  mongo-demo:
    image: mongo:latest
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=admin
      - MONGO_INITDB_ROOT_PASSWORD=supersecret
  mongo-express:
    image: mongo-express
    ports:
      - 8081:8081
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret
      - ME_CONFIG_MONGODB_SERVER=mongo-demo
      - ME_CONFIG_MONGODB_URL=mongodb://admin:supersecret@mongo-demo:27017/
      - ME_CONFIG_MONGODB_ENABLE_ADMIN=true
      - ME_CONFIG_OPTIONS_EDITORTHEME=material-darker
      - ME_CONFIG_REQUEST_SIZE=100kb
      - ME_CONFIG_SITE_BASEURL=/
      - ME_CONFIG_SITE_COOKIESECRET=cookiesecret
      - ME_CONFIG_SITE_SESSIONSECRET=sessionsecret
      - ME_CONFIG_SITE_SSL_ENABLED=false
      - ME_CONFIG_MONGODB_AUTH_USERNAME=admin
      - ME_CONFIG_MONGODB_AUTH_PASSWORD=pass
      - ME_CONFIG_MONGODB_PORT=27017
```

### **Resumen**

*Eliminar el atributo `version` es seguro y recomendado en proyectos con Docker Compose actualizado, eliminando advertencias y adaptando tu configuración a los estándares actuales.*

```bash
docker network rm --force version1mongoservices_default;
docker rm --force version1mongoservices-mongo-demo-1 version1mongoservices-mongo-express-1;
```

```bash
docker network rm -f version1mongoservices_default
docker rm -f version1mongoservices-mongo-demo-1 version1mongoservices-mongo-express-1 
```

- **Ejecutamos**

```bash
docker compose --file mongo-services.yaml up;
```

```bash
docker compose -f mongo-services.yaml up;
```

```bash
docker compose -fmongo-services.yaml up;
```

```bash
docker compose --file mongo-services.yaml up;
[+] Running 3/3
 ✔ Network version2mongoservices_default            Created                                                          0.1s
 ✔ Container version2mongoservices-mongo-demo-1     Created                                                          0.1s
 ✔ Container version2mongoservices-mongo-express-1  Created                                                          0.1s
Attaching to mongo-demo-1, mongo-express-1
mongo-express-1  | Waiting for mongo-demo:27017...
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | about to fork child process, waiting until server is ready for connections.
mongo-demo-1     | forked process: 27
mongo-demo-1     |
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.555+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.557+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.563+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.575+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.579+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.580+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.580+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":27,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"27678bb5d1c1"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.580+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.581+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.581+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"127.0.0.1","port":27017,"tls":{"mode":"disabled"}},"processManagement":{"fork":true,"pidFilePath":"/tmp/docker-entrypoint-temp-mongod.pid"},"systemLog":{"destination":"file","logAppend":true,"path":"/proc/1/fd/1"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.586+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:55.586+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
mongo-express-1  | Sun Jan 12 19:45:56 UTC 2025 retrying to connect to mongo-demo:27017 (2/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.616+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711156,"ts_usec":616179,"thread":"27:0x74e58610f680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.616+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711156,"ts_usec":616287,"thread":"27:0x74e58610f680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.616+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711156,"ts_usec":616340,"thread":"27:0x74e58610f680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.616+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711156,"ts_usec":616450,"thread":"27:0x74e58610f680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 0ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.631+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1044}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.631+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.649+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.650+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.651+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.651+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.651+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.651+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.651+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.652+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"32cf3344-4f2e-4fcf-ad47-e4d4d6d4bed2"}},"options":{"uuid":{"$uuid":"32cf3344-4f2e-4fcf-ad47-e4d4d6d4bed2"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.670+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"32cf3344-4f2e-4fcf-ad47-e4d4d6d4bed2"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-11880475799737813972","collectionIdent":"collection-0-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.671+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"8.0"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.671+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"setFCV"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.671+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.672+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.672+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.673+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.673+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.673+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.674+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.684+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"417d398e-5618-46ea-8076-d96441eaece2"}},"options":{"capped":true,"size":10485760}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.696+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"417d398e-5618-46ea-8076-d96441eaece2"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-11880475799737813972","collectionIdent":"collection-2-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.696+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.696+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.697+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.700+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.700+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"127.0.0.1:27017"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.700+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.703+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"1 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1058 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"0 ms","Initialize FCV before rebuilding indexes":"1 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"1 ms","Start up the replication coordinator":"0 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1120 ms"}}}}
mongo-demo-1     | child process started successfully, parent exiting
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.711+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.712+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"4878ac9d-6c07-4aa4-a24b-0f0bc99c10a1"}},"options":{}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.736+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"4878ac9d-6c07-4aa4-a24b-0f0bc99c10a1"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-11880475799737813972","collectionIdent":"collection-4-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:56.737+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"4878ac9d-6c07-4aa4-a24b-0f0bc99c10a1"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-11880475799737813972","collectionIdent":"collection-4-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.009+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.009+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
mongo-express-1  | Sun Jan 12 19:45:57 UTC 2025 retrying to connect to mongo-demo:27017 (3/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.550+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:37326","uuid":{"uuid":{"$uuid":"8244d3d5-5766-4a93-bf30-4f5929a4c4f3"}},"connectionId":1,"connectionCount":1}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.562+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"127.0.0.1:37326","client":"conn1","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:57.690+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"127.0.0.1:37326","uuid":{"uuid":{"$uuid":"8244d3d5-5766-4a93-bf30-4f5929a4c4f3"}},"connectionId":1,"connectionCount":0}}
mongo-express-1  | Sun Jan 12 19:45:58 UTC 2025 retrying to connect to mongo-demo:27017 (4/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.200+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:37342","uuid":{"uuid":{"$uuid":"3633e7af-99a3-4b11-9bdc-da049511f1e3"}},"connectionId":2,"connectionCount":1}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.211+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"127.0.0.1:37342","client":"conn2","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.303+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:37348","uuid":{"uuid":{"$uuid":"19f53e96-c92c-4542-a78a-d9ff07115937"}},"connectionId":3,"connectionCount":2}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.304+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:37362","uuid":{"uuid":{"$uuid":"01a43f5d-3ab5-48ed-beb7-a196e735c385"}},"connectionId":4,"connectionCount":3}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.307+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"127.0.0.1:37348","client":"conn3","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.313+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"127.0.0.1:37362","client":"conn4","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.319+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn3","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":11}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.321+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:37366","uuid":{"uuid":{"$uuid":"fd5538ac-8629-40c3-aa15-2f422e029252"}},"connectionId":5,"connectionCount":4}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.330+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"127.0.0.1:37366","client":"conn5","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.4"},"driver":{"name":"nodejs|mongosh","version":"6.11.0|2.3.4"},"platform":"Node.js v20.18.1, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.338+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn5","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":8}}
mongo-demo-1     | admin> ... ... ... ... {"t":{"$date":"2025-01-12T19:45:58.855+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"conn5","msg":"createCollection","attr":{"namespace":"admin.system.users","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"403fc6ec-68f7-42f9-ab25-762efaf20be5"}},"options":{}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.874+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"403fc6ec-68f7-42f9-ab25-762efaf20be5"}},"namespace":"admin.system.users","index":"_id_","ident":"index-8-11880475799737813972","collectionIdent":"collection-7-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.874+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"403fc6ec-68f7-42f9-ab25-762efaf20be5"}},"namespace":"admin.system.users","index":"user_1_db_1","ident":"index-9-11880475799737813972","collectionIdent":"collection-7-11880475799737813972","commitTimestamp":null}}
mongo-demo-1     | { ok: 1 }
mongo-demo-1     | admin> {"t":{"$date":"2025-01-12T19:45:58.897+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn2","msg":"Interrupted operation as its client disconnected","attr":{"opId":14337}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.898+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"127.0.0.1:37366","uuid":{"uuid":{"$uuid":"fd5538ac-8629-40c3-aa15-2f422e029252"}},"connectionId":5,"connectionCount":3}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.899+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"127.0.0.1:37362","uuid":{"uuid":{"$uuid":"01a43f5d-3ab5-48ed-beb7-a196e735c385"}},"connectionId":4,"connectionCount":2}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.900+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"127.0.0.1:37348","uuid":{"uuid":{"$uuid":"19f53e96-c92c-4542-a78a-d9ff07115937"}},"connectionId":3,"connectionCount":1}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.903+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"127.0.0.1:37342","uuid":{"uuid":{"$uuid":"3633e7af-99a3-4b11-9bdc-da049511f1e3"}},"connectionId":2,"connectionCount":0}}
mongo-demo-1     |
mongo-demo-1     | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
mongo-demo-1     |
mongo-demo-1     |
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.973+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.980+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.981+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.982+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.983+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | Killing process with pid: 27
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.986+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.986+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":107,"uid":999}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.986+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.986+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.989+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.989+00:00"},"s":"I",  "c":"STORAGE",  "id":7333402, "ctx":"SignalHandler","msg":"Shutting down the DiskSpaceMonitor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.989+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.989+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.989+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.990+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.991+00:00"},"s":"I",  "c":"NETWORK",  "id":8314100, "ctx":"SignalHandler","msg":"Shutdown: Closing listener sockets"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.992+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.992+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.992+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.992+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.992+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.993+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.993+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.993+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.993+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.994+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: Closing open transport sessions"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"NETWORK",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ASIO transport SessionManager"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.995+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.996+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.996+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.996+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.996+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.996+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.997+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.998+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:58.998+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.000+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.007+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711159,"ts_usec":7920,"thread":"27:0x74e5860006c0","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 46, snapshot max: 46 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.030+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711159,"ts_usec":30495,"thread":"27:0x74e5860006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 26 milliseconds"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.031+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711159,"ts_usec":31009,"thread":"27:0x74e5860006c0","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 29ms, including 0ms for the rollback to stable, and 26ms for the checkpoint."}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.043+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":43}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.043+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.044+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.044+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.048+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.048+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"3 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"0 ms","Shut down WaitForMajorityService":"1 ms","Shut down the logical session cache":"0 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Shut down the thread that aborts expired transactions":"0 ms","Kill all operations for shutdown":"1 ms","Shut down all tenant migration access blockers on global shutdown":"0 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"1 ms","Shut down the transport layer":"0 ms","Shut down the health log":"0 ms","Shut down the TTL monitor":"1 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"48 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"0 ms","Shut down online certificate status protocol manager":"0 ms","shutdownTask total elapsed time":"62 ms"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:45:59.048+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}
mongo-express-1  | Sun Jan 12 19:45:59 UTC 2025 retrying to connect to mongo-demo:27017 (5/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     |
mongo-demo-1     | MongoDB init process complete; ready for start up.
mongo-demo-1     |
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.050+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.051+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.052+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set at least one of the related parameters","attr":{"relatedParameters":["tcpFastOpenServer","tcpFastOpenClient","tcpFastOpenQueueSize"]}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.055+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.057+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.057+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"27678bb5d1c1"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.057+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"8.0.4","gitVersion":"bc35ab4305d9920d9d0491c1c9ef9b72383d31f9","openSSLVersion":"OpenSSL 3.0.13 30 Jan 2024","modules":[],"allocator":"tcmalloc-google","environment":{"distmod":"ubuntu2404","distarch":"x86_64","target_arch":"x86_64"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.057+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"24.04"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.057+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.061+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.061+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:00.061+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],prefetch=(available=true,default=false),"}}
mongo-express-1  | Sun Jan 12 19:46:00 UTC 2025 retrying to connect to mongo-demo:27017 (6/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.070+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":70903,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
mongo-express-1  | Sun Jan 12 19:46:01 UTC 2025 retrying to connect to mongo-demo:27017 (7/10)
mongo-express-1  | /docker-entrypoint.sh: connect: Connection refused
mongo-express-1  | /docker-entrypoint.sh: line 15: /dev/tcp/mongo-demo/27017: Connection refused
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.199+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":199850,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.319+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":319181,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 1/32128 to 2/256"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.444+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":444164,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.529+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":528955,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.596+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":595983,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 525 milliseconds"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.596+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":596116,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.596+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":596189,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.598+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":598214,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 1 milliseconds"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.606+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":606825,"thread":"1:0x73c2d9d09680","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":7,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.613+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":613126,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 14 milliseconds"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.613+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1736711161,"ts_usec":613303,"thread":"1:0x73c2d9d09680","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":34,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 542ms, including 525ms for the log replay, 1ms for the rollback to stable, and 14ms for the checkpoint."}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.620+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1559}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.620+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.630+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/enabled","currentValue":"never","desiredValue":"always"},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.630+00:00"},"s":"W",  "c":"CONTROL",  "id":9068900, "ctx":"initandlisten","msg":"For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile","attr":{"allocator":"tcmalloc-google","sysfsFile":"/sys/kernel/mm/transparent_hugepage/defrag","currentValue":"madvise","desiredValue":"defer+madvise"},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.630+00:00"},"s":"W",  "c":"CONTROL",  "id":8640302, "ctx":"initandlisten","msg":"We suggest setting the contents of sysfsFile to 0.","attr":{"sysfsFile":"/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none","currentValue":511},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.630+00:00"},"s":"W",  "c":"CONTROL",  "id":8718500, "ctx":"initandlisten","msg":"Your system has glibc support for rseq built in, which is not yet supported by tcmalloc-google and has critical performance implications. Please set the environment variable GLIBC_TUNABLES=glibc.pthread.rseq=0","tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.630+00:00"},"s":"W",  "c":"NETWORK",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.631+00:00"},"s":"W",  "c":"CONTROL",  "id":8386700, "ctx":"initandlisten","msg":"We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.","attr":{"sysfsFile":"/proc/sys/vm/swappiness","currentValue":60},"tags":["startupWarnings"]}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.637+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":25},"outgoing":{"minWireVersion":6,"maxWireVersion":25},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":25},"incomingInternalClient":{"minWireVersion":25,"maxWireVersion":25},"outgoing":{"minWireVersion":25,"maxWireVersion":25},"isInternalClient":true}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.637+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"8.0","context":"startup"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.637+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.640+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.640+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.641+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.645+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.645+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.646+00:00"},"s":"I",  "c":"STORAGE",  "id":7333401, "ctx":"initandlisten","msg":"Starting the DiskSpaceMonitor"}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.647+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.647+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0:27017"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.647+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:01.648+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Set up periodic runner":"0 ms","Set up online certificate status protocol manager":"0 ms","Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1561 ms","Write current PID to file":"0 ms","Initialize FCV before rebuilding indexes":"6 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Start up the replication coordinator":"0 ms","Ensure the change stream collections on startup contain consistent data":"0 ms","Write startup options to the audit log":"0 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1590 ms"}}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.019+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"internalQueryCacheSize","canonicalName":"internalQueryCacheMaxEntriesPerCollection"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.020+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"oplogSamplingLogIntervalSeconds","canonicalName":"collectionSamplingLogIntervalSeconds"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.020+00:00"},"s":"W",  "c":"NETWORK",  "id":23803,   "ctx":"ftdc","msg":"Use of deprecated server parameter 'sslMode', please use 'tlsMode' instead."}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.020+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentReadTransactions","canonicalName":"storageEngineConcurrentReadTransactions"}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.020+00:00"},"s":"W",  "c":"CONTROL",  "id":636300,  "ctx":"ftdc","msg":"Use of deprecated server parameter name","attr":{"deprecatedName":"wiredTigerConcurrentWriteTransactions","canonicalName":"storageEngineConcurrentWriteTransactions"}}
mongo-express-1  | Sun Jan 12 19:46:02 UTC 2025 retrying to connect to mongo-demo:27017 (8/10)
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.087+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.19.0.3:57316","uuid":{"uuid":{"$uuid":"c1fb2175-6349-4225-b0ff-2611deaafb9f"}},"connectionId":1,"connectionCount":1}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:02.088+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"172.19.0.3:57316","uuid":{"uuid":{"$uuid":"c1fb2175-6349-4225-b0ff-2611deaafb9f"}},"connectionId":1,"connectionCount":0}}
mongo-express-1  | No custom config.js found, loading config.default.js
mongo-express-1  | Welcome to mongo-express 1.0.2
mongo-express-1  | ------------------------
mongo-express-1  |
mongo-express-1  |
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:03.961+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.19.0.3:52314","uuid":{"uuid":{"$uuid":"63a49573-f938-4a28-b8f0-6fb5e13c2a00"}},"connectionId":2,"connectionCount":1}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:03.974+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"172.19.0.3:52314","client":"conn2","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:03.989+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.19.0.3:52318","uuid":{"uuid":{"$uuid":"f5ef1dcc-5f19-4f74-9d42-16d61b6e9a2f"}},"connectionId":3,"connectionCount":2}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:03.993+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.19.0.3:52318","client":"conn3","negotiatedCompressors":[],"doc":{"driver":{"name":"nodejs","version":"4.13.0"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"6.8.0-51-generic"},"platform":"Node.js v18.20.3, LE (unified)|Node.js v18.20.3, LE (unified)"}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:03.997+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn3","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:04.030+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn3","msg":"Successfully authenticated","attr":{"client":"172.19.0.3:52318","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"admin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":32990,"summary":{"0":{"step":1,"step_total":2,"duration_micros":112},"1":{"step":2,"step_total":2,"duration_micros":43}}}},"extraInfo":{}}}
mongo-demo-1     | {"t":{"$date":"2025-01-12T19:46:04.035+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn3","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":5}}
mongo-express-1  | Mongo Express server listening at http://0.0.0.0:8081
mongo-express-1  | Server is open to allow connections from anyone (0.0.0.0)
mongo-express-1  | basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
```
