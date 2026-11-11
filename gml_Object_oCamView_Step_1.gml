ds_priority_clear(depth_queue);

with (oAnimatronicParent)
    ds_priority_add(other.depth_queue, id, 100 - depth);
