library(data.table)
library(gtools)

SankeyClockWiseOrder=function(yourData,yourOrder){
  skDt=data.table(yourData)
  cwo=yourOrder
  cwoDt=data.table(permutations(n=length(cwo),
                                r=2,
                                cwo))
  names(cwoDt)=c("from","to")
  cwoDt$byCol=paste0(cwoDt$from,cwoDt$to)
  skDt$byCol=paste0(sankeydf$from,sankeydf$to)
  skDtMerge=merge(cwoDt,skDt,all = T)
  skDtcwo=skDtMerge[order(match(from,cwo),
                          match(to,cwo))]
  return(skDtcwo)
}
