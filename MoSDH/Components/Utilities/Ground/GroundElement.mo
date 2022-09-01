within MoSDH.Components.Utilities.Ground;

model GroundElement "Ground element for radial symmetric models"
  extends BaseClasses.partialGroundElement;
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor resistanceCenterToInner(R = if innerRadius > 0 then log((innerRadius + outerRadius) / max(0.1, 2 * innerRadius)) / max(0.1, 2 * Modelica.Constants.pi * elementHeight * groundData.lamda) else 1) "Lumped thermal element transporting heat without storing it" annotation(
    Placement(transformation(extent = {{-80, 0}, {-60, 20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor resistanceCenterToOuter(R = if innerRadius > 0 then log(2 * outerRadius / (outerRadius + innerRadius)) / max(0.1, 2 * Modelica.Constants.pi * elementHeight * groundData.lamda) else log(outerRadius / 0.075) / (2 * Modelica.Constants.pi * elementHeight * groundData.lamda)) "Lumped thermal element transporting heat without storing it" annotation(
    Placement(transformation(extent = {{5, 0}, {25, 20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor resistanceCenterToTop(R = elementHeight / max(0.1, 2 * Modelica.Constants.pi * groundData.lamda * (outerRadius ^ 2 - innerRadius ^ 2))) "Lumped thermal element transporting heat without storing it" annotation(
    Placement(transformation(origin = {-32.5, 52.5}, extent = {{-7.5, -7.5}, {12.5, 12.5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor resistanceCenterToBottom(R = elementHeight / (2 * Modelica.Constants.pi * groundData.lamda * (outerRadius ^ 2 - innerRadius ^ 2))) "Lumped thermal element transporting heat without storing it" annotation(
    Placement(transformation(origin = {-32.5, -7.5}, extent = {{-12.5, -12.5}, {7.5, 7.5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor thermalCapacity(C = (outerRadius ^ 2 - innerRadius ^ 2) * Modelica.Constants.pi * elementHeight * groundData.rho * groundData.cp, T(start = Tinitial, fixed = true)) annotation(
    Placement(transformation(extent = {{-25, 15}, {-5, 35}})));
equation
  connect(resistanceCenterToInner.port_a, innerHeatPort) annotation(
    Line(points = {{-80, 10}, {-85, 10}, {-90, 10}, {-95, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToTop.port_a, topHeatPort) annotation(
    Line(points = {{-30, 60}, {-30, 65}, {-30, 75}, {-25, 75}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToBottom.port_a, bottomHeatPort) annotation(
    Line(points = {{-30, -20}, {-30, -25}, {-30, -35}, {-25, -35}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToOuter.port_b, outerHeatPort) annotation(
    Line(points = {{25, 10}, {30, 10}, {40, 10}, {45, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToBottom.port_b, thermalCapacity.port) annotation(
    Line(points = {{-30, 0}, {-30, 5}, {-30, 10}, {-15, 10}, {-15, 15}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToOuter.port_a, thermalCapacity.port) annotation(
    Line(points = {{5, 10}, {0, 10}, {-15, 10}, {-15, 15}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToTop.port_b, thermalCapacity.port) annotation(
    Line(points = {{-30, 40}, {-30, 35}, {-30, 10}, {-15, 10}, {-15, 15}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(resistanceCenterToInner.port_b, thermalCapacity.port) annotation(
    Line(points = {{-60, 10}, {-55, 10}, {-15, 10}, {-15, 15}}, color = {191, 0, 0}, thickness = 0.0625));
  annotation(
    Icon(graphics = {Bitmap(imageSource = "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", extent = {{-106.4, -109.6}, {113.8, 103.8}})}),
    Documentation(info = "<html>
<p>
Element for subsurface conductive heat transport.
</p>



</html>"),
    experiment(StopTime = 1, StartTime = 0, Tolerance = 1e-06, Interval = 0.001));
end GroundElement;
