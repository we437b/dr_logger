// Generated by gencpp from file deepracer_msgs/Control_input.msg
// DO NOT EDIT!


#ifndef DEEPRACER_MSGS_MESSAGE_CONTROL_INPUT_H
#define DEEPRACER_MSGS_MESSAGE_CONTROL_INPUT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace deepracer_msgs
{
template <class ContainerAllocator>
struct Control_input_
{
  typedef Control_input_<ContainerAllocator> Type;

  Control_input_()
    : Throttle(0.0)
    , angle(0.0)
    , Emergency_stops(0)  {
    }
  Control_input_(const ContainerAllocator& _alloc)
    : Throttle(0.0)
    , angle(0.0)
    , Emergency_stops(0)  {
  (void)_alloc;
    }



   typedef double _Throttle_type;
  _Throttle_type Throttle;

   typedef double _angle_type;
  _angle_type angle;

   typedef int8_t _Emergency_stops_type;
  _Emergency_stops_type Emergency_stops;





  typedef boost::shared_ptr< ::deepracer_msgs::Control_input_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepracer_msgs::Control_input_<ContainerAllocator> const> ConstPtr;

}; // struct Control_input_

typedef ::deepracer_msgs::Control_input_<std::allocator<void> > Control_input;

typedef boost::shared_ptr< ::deepracer_msgs::Control_input > Control_inputPtr;
typedef boost::shared_ptr< ::deepracer_msgs::Control_input const> Control_inputConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepracer_msgs::Control_input_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepracer_msgs::Control_input_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::deepracer_msgs::Control_input_<ContainerAllocator1> & lhs, const ::deepracer_msgs::Control_input_<ContainerAllocator2> & rhs)
{
  return lhs.Throttle == rhs.Throttle &&
    lhs.angle == rhs.angle &&
    lhs.Emergency_stops == rhs.Emergency_stops;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::deepracer_msgs::Control_input_<ContainerAllocator1> & lhs, const ::deepracer_msgs::Control_input_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace deepracer_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::deepracer_msgs::Control_input_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepracer_msgs::Control_input_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepracer_msgs::Control_input_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepracer_msgs::Control_input_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepracer_msgs::Control_input_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepracer_msgs::Control_input_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepracer_msgs::Control_input_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ee15870a09046e7814ea809ce3c9164e";
  }

  static const char* value(const ::deepracer_msgs::Control_input_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xee15870a09046e78ULL;
  static const uint64_t static_value2 = 0x14ea809ce3c9164eULL;
};

template<class ContainerAllocator>
struct DataType< ::deepracer_msgs::Control_input_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepracer_msgs/Control_input";
  }

  static const char* value(const ::deepracer_msgs::Control_input_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepracer_msgs::Control_input_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 Throttle\n"
"float64 angle\n"
"int8 Emergency_stops\n"
;
  }

  static const char* value(const ::deepracer_msgs::Control_input_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepracer_msgs::Control_input_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Throttle);
      stream.next(m.angle);
      stream.next(m.Emergency_stops);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Control_input_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepracer_msgs::Control_input_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepracer_msgs::Control_input_<ContainerAllocator>& v)
  {
    s << indent << "Throttle: ";
    Printer<double>::stream(s, indent + "  ", v.Throttle);
    s << indent << "angle: ";
    Printer<double>::stream(s, indent + "  ", v.angle);
    s << indent << "Emergency_stops: ";
    Printer<int8_t>::stream(s, indent + "  ", v.Emergency_stops);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPRACER_MSGS_MESSAGE_CONTROL_INPUT_H
