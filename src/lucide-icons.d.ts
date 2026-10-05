declare module 'lucide-react/dist/esm/icons/*.js' {
  import type { ComponentType, JSX } from 'preact'
  type IconComponent = ComponentType<JSX.SVGAttributes<SVGSVGElement> & { size?: number | string; strokeWidth?: number; absoluteStrokeWidth?: boolean }>
  const Icon: IconComponent
  export default Icon
}
