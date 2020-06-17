let lastProfilingLevel;
let profilingStartTs;

profiling = {
  start() {
    lastProfilingLevel = db.getProfilingLevel();
    if (lastProfilingLevel !== 2) {
      print(`Setting profiling level to 2 (was ${lastProfilingLevel}).`);
      db.setProfilingLevel(2);
    }
    profilingStartTs = ISODate();
  },

  stop() {
    if (lastProfilingLevel !== 2) {
      print(`Setting profiling level back to ${lastProfilingLevel}.`);
      db.setProfilingLevel(2);
    }
    db.system.profile.find({
      op: 'query',
      ts: {
        $gt: profilingStartTs,
        $lte: ISODate()
      }
    }).forEach(printjson);
  },
}
