import os
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch.actions.include_launch_description import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory

def generate_launch_description():
    # Arguments
    muto_namespace_arg = DeclareLaunchArgument("muto_namespace", default_value="muto")
    vehicle_id_namespace_arg = DeclareLaunchArgument(
        "vehicle_id_namespace",
        default_value="org.eclipse.muto.sandbox",
        description="Vehicle ID namespace",
    )
    vehicle_id_arg = DeclareLaunchArgument(
        "vehicle_id", default_value="hackracer-91", description="ATT ID"
    )

    # for prints
    os.environ["PYTHONUNBUFFERED"] = "1"

    # Files
    muto_params = "./config/muto.yaml"

    # Agent
    node_agent = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="agent",
        package="agent",
        executable="muto_agent",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    node_mqtt_gateway = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="gateway",
        package="agent",
        executable="mqtt",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    node_commands = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="commands_plugin",
        package="agent",
        executable="commands",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    # Core
    node_twin = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="core_twin",
        package="core",
        executable="twin",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    # Composer
    node_composer = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="muto_composer",
        package="composer",
        executable="muto_composer",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    node_compose_plugin = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="compose_plugin",
        package="composer",
        executable="compose_plugin",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    node_native_plugin = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="native_plugin",
        package="composer",
        executable="native_plugin",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    node_launch_plugin = Node(
        namespace=LaunchConfiguration("muto_namespace"),
        name="launch_plugin",
        package="composer",
        executable="launch_plugin",
        output="screen",
        parameters=[
            muto_params,
            {"namespace": LaunchConfiguration("vehicle_id_namespace")},
            {"name": LaunchConfiguration("vehicle_id")},
        ],
    )

    launch_introspection = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(get_package_share_directory("composer"), "launch", "introspection.launch.py")
        )
    )

    # Launch Description Object
    ld = LaunchDescription()

    ld.add_action(muto_namespace_arg)
    ld.add_action(vehicle_id_namespace_arg)
    ld.add_action(vehicle_id_arg)

    ld.add_action(node_agent)
    ld.add_action(node_mqtt_gateway)
    ld.add_action(node_commands)
    ld.add_action(node_twin)
    ld.add_action(node_composer)
    ld.add_action(node_compose_plugin)
    ld.add_action(node_native_plugin)
    ld.add_action(node_launch_plugin)
    # ld.add_action(launch_introspection)

    return ld
