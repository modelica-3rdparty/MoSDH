within MoSDH.Components.Storage.PitStorage.Functions;
function slopeElementCoordinates "Determines row and column indices for elements within a triangular mesh region"
 input Boolean isInnerSlope "=true, if inner triangular region";
 input Integer nElements "Number of elements";
 input Integer nElementsR "Radial size of mesh";
 output Integer elementCoordinates[nElements,2] "Matrix containing the ground data";
protected
  Integer i "element index";
algorithm
  /*------ EMBANKMENT ELEMENT NUMBERING 'i' -----
				  INNER SLOPE 		OUTER SLOPE
					-	-	1		1	-	-
					-	2	3		2	3	-
					4	5	6		4	5	6
			-----------------------------------------------*/
   i:=1;
   for z in 1:nElementsR loop
    for r in 1:nElementsR loop
     if isInnerSlope then
      if r>nElementsR-z then
      elementCoordinates[i]:={z,r};
      i:=i+1;
      end if;
     elseif r<=z then
      elementCoordinates[i]:={z,r};
      i:=i+1;
     end if;
    end for;
   end for;
 annotation(Icon(graphics={
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{-50,-50},{0,-100}}),
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{0,-50.2},{50,-100.2}}),
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{49.7,-50.2},{99.7,-100.2}}),
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{0.2,0},{50.2,-50}}),
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{49.9,-0.3},{99.90000000000001,-50.3}}),
  Rectangle(
   fillColor={255,255,255},
   fillPattern=FillPattern.Solid,
   extent={{49.9,50.2},{99.90000000000001,0.2}}),
  Text(
   textString="{z,r}",
   fontSize=22,
   extent={{-176.6,172.6},{156.4,-57.1}})}));
end slopeElementCoordinates;