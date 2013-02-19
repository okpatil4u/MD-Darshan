%pythonprepend OpenMM::Platform::registerPlatform(Platform *platform) %{
   if not args[0].thisown:
      s = "the %s object does not own its corresponding OpenMM object" \
         % args[0].__class__.__name__
      raise Exception(s)
%}

%pythonprepend OpenMM::System::setVirtualSite(int index, VirtualSite *virtualSite) %{
   if not args[1].thisown:
      s = "the %s object does not own its corresponding OpenMM object" \
         % args[1].__class__.__name__
      raise Exception(s)
%}

%pythonprepend OpenMM::System::addForce(Force *force) %{
   if not args[0].thisown:
      s = "the %s object does not own its corresponding OpenMM object" \
         % args[0].__class__.__name__
      raise Exception(s)
%}

