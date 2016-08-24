
Pod::Spec.new do |s|
  s.name         = "ZDQFlowView"
  s.version      = "0.0.1"
  s.summary      = "类似支付宝购物流程"
  s.homepage     = "https://github.com/CoderDqZhang/ZDQFlowView"
  s.license      = "MIT"
  s.author       = { "CoderDqZhang" => "769839948@qq.com" }
  s.platform     = :ios,"8.0"
  s.source       = { :git => "https://github.com/CoderDqZhang/ZDQFlowView", :tag => "#{s.version}"}
  s.source_files = 'FlowView/*'
  s.resources    = "FlowView/*.{png,xib,nib,bundle}"
  s.requires_arc = true
end
