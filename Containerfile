# Replace this reference to an on premises image registry
FROM registry.access.redhat.com/ubi8/python-27

USER root

# Upgrade pip then install an old version of ansible
# Replace the pypi index with on premises nexus mirror
RUN pip install pip --upgrade \
    pip install ansible==2.1.0.0



# Attempt to run the old ansible playbook to verify
COPY old-playbook.yaml /
COPY include-task.yaml /
RUN ansible-playbook /old-playbook.yaml
