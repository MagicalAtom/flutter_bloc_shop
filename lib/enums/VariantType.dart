enum VariantTypeEnum { Color, Storage, Voltage, Null }

VariantTypeEnum getTypeVariant(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.Color;
    case 'Storage':
      return VariantTypeEnum.Storage;
    case 'Voltage':
      return VariantTypeEnum.Voltage;
    default:
      return VariantTypeEnum.Null;
  }
}
