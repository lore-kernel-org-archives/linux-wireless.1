Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158552;
	b=tgLPdbTAW2/DnC99rqB3zwX/Ms/zUTuMOkvddEkH5XYB3tx+jV6AEXriRwPYkE9EC8xo
	 W39Nl9d2c3ZAnJzy9p4Ht3SNcf4S3Fclr9VzRzJJRHjeoqC54hygINBt6tHo6S4jUxPCw
	 jOBeO2TDdk5/fZdgfFfbp8dsiPv51pciHcQj8e+dm/wTHMlZZjcwrZ1eVuQGuC3bS1HTZ
	 p574yu+Xfo7Ck6hhopc7Yi7VzvRtMSui6PdthE7OFR5WPl6WGH9vYw0FiYbqSGzc9zwXh
	 eAwlyIvWLXfS0eePYsfs6zKTL4vYZKYpeYrPULee/QSZ4SECuK2IIk/oLPmyALEJXIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=;
	b=KGy4/bIWTBCzAV1nXduhQKBlgDawAA+msYfPMhU+4ioHJMkHHltVzYd7ClMGPwgihCYL
	 GRXnxpH+yAcOcV4aVlM1kUIuRajVzBKi81ll6N9JhpaH6OfrthoTEnGM2tlhQ60rIJa2k
	 zh9++3k3c8HaRiOQYc/2WD8g/wJcYyfHvMbZm4uuchIsj7J9Pi55nq12ziZ1AvZ6e0XIB
	 Rpsh5VvsvlDJnHv9eKTOtO0oBK+0Hpi0JaSnlh1iwYCuUEqa7RTpjV9T8pSOHh9EklRo7
	 SeuzLmrcVzzA+FUyorqdoPbBByVtRJmaSpQbtsjK3z9zHR2W3PL0YMmSO3MCslbLPKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D9um5Vz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGXY2GL+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A5606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 07:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9um5Vz/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGXY2GL+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK4NdAk1304341
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 07:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+
	uZHJN5Yw=; b=D9um5Vz/DrHjtqSblFGAn8XcTP3F+Qyo7KmGzcPT++sQ1tPdGNc
	pdjO+UdQcPDhEjVpW2pOOzEJEA5UV/C1cw4SkZqxeJmnoCouuVdJYYTkJzaVp6oV
	vMJIF6cl4KQZqLWxGVaI0O2lD/Uk3QFFFXedx+U+b+cEQAMvD0psGnzWBjGPW1QH
	b+/B3bPrqWCQaaFGJEPFuKOFa7vzHZu1SEh8H8C3/w+9xO23Wa64v8mlnpmuvzwV
	I2JGVv4vDQlk0U+S2njku5iz79BfneMt0ZmZ9ojR5F2mv8+4Rl3hZ7DIjqnLlsep
	9IP8KBif/ETzQlA8U2U81Uf6UgloZF4EKAQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygkax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 07:09:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde00369ef5so455516a12.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795158549; x=1795763349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=;
        b=YGXY2GL+jKYD+WVpgYYCDJO9GQSpVic92w2BfUehyXZ42TSz9jInBXFLuCsRVT28/U
         M/uqKE7lnxm2ER4YCbLff99S3/ZtpQlQoayRbxiMoW3692wH3zniJerK2tuOThUZ9Cgq
         Q/oTAIOnqO82c9DK1Ac4fwD/MBUblHJTAo4C4vucYszedxk2mbhDUD9C3IsWR5lZkhEE
         PRsyW3JAPFoS6evWKLGji5xk4YLvmkqBwzh855hocXEnT0i+6ZADcUHqrMSpL9fKQ2kn
         LcDhDTHPQoRMWuCjJF5JeXSgs4kLFFmEXfQnWrs48llrQN1sC6xLSj4Hn1rzzeqxBo6g
         fcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158549; x=1795763349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=;
        b=oQlZAOzXuVHCs4XFNyNYwIeHqvDNuR1bQ3r7qrQT1uwDdPX3j7RGqO3mtQlYzvQ4yF
         jdUtMWJabiixhAMhinVJPA1PTtTajWsa4RKwEBTVZOofczx0iqau9w5WXQ+sjEUP+hoQ
         9Gweyrq7xrTfMui72wCbNqlEUfT/Uyrv47YUCwpAYKiUIlKOED5NCG5051fy9OHKB5vn
         XKT7EtPS59i/T89kekkiJVT83eUrVy9ZWly6kjl7TJBsk1Plw57tEJGwNXSgPsqcNDmK
         9YOWlzCC1my0vdYjz+MpIvu3Nryqm/eA0DS06Kq2ieMoTQkhHlVxx6lv5mNPSpKBdhdj
         AiHg==
X-Gm-Message-State: APuU4Z/3tbrXR2kQmCq8Hl5TJKoqeiU/XFiEuoEaXmfWXg19xMv3BbhA
	glhm7t0d997GPotfi+dr5xHUCqsPWb316Azdhi+ztI4fb4zwrUT23FyAEoRPH1nPYfFqCu/Mb7N
	kqmx+l+PI9IZDJL97+eZvTzlsHnOimUqtNA7PKkTlFrW9Dv4YXAvApdn0Y1FWpY0wJ96Y/g==
X-Gm-Gg: AZFdTZf+ZCnHatgVETJsU2xNZk+vpiC/CLujGzmxoTIk4xqxuSiMhJ9ig4AZf91qwrN
	Hw/m72qlsP+yfSxYf93uJ0NGp3RqOwjR8uNMReYO7pgOOFc9yEemvqiFpOaHwQbVKqGr5r1LslE
	yK1e9y56HmhrawNxNSXeV0Pewflw+IYcagaDNTOHDd7m8BmL9VGqulOAiqqgqAu8oh8M1DzGsuJ
	l6k6zexjEo3pfc+2/RdB2cvaeL0cS8KzwFX7tQ7tJqLI8Iv2OWBx30I/WyoTw29rkMXOA4+k83h
	YIjPPYURoJa2K5GfHssp71BJ1aRHd+2I/976BJb8Yl9GIwpk+ZFEJf6FYDurj1vtl44I4OE39KG
	esSfhG6anh4EPfZx7G5VC35KfmzZjVRac7fILNieQQ/1xGVMaldWEBsU+z2A115t7DZR8qAJGqa
	Fqq9S7v8/UTSJ9o23hyAtKCBydFsGOYrVdQJT4lmIlXa/esSQ0a41MFRKmJfrJC+Y=
X-Received: by 2002:a17:90b:388b:b0:3b4:574:3bd6 with SMTP id 98e67ed59e1d1-3b41c982e09mr1817117a91.66.1795158548837;
        Thu, 19 Nov 2026 23:09:08 -0800 (PST)
X-Received: by 2002:a17:90b:388b:b0:3b4:574:3bd6 with SMTP id 98e67ed59e1d1-3b41c982e09mr1817090a91.66.1795158548235;
        Thu, 19 Nov 2026 23:09:08 -0800 (PST)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22aaeesm1057062a91.3.2026.11.19.23.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:09:07 -0800 (PST)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: add hash table for peer lookup in struct  ath12k_dp_hw
Date: Fri, 20 Nov 2026 12:39:00 +0530
Message-Id: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6afff216 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=e0xTfCGfjV48Ql1BNNoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfX6qVWbp21uoUA
 QK0aCmK6Ybhhp4wqNxWgpS5s6HUL2RRyvccTIxp0QHh2Mnmk32bmCKbjINwFdGdwb5uIpfIiraH
 3iyK407eHrKtyBHEAcKo+KBLa8G/Ud630Z2fGHgqCwitQ0EOfPFdyFBDXQrnXelR1ofrF5xmy/P
 mwkPLyAMmqePPg9SJUzlb5se0rZQpT6ydfJqa6TYaqPsALChAYrj0umT/NvAbo15OEQks7zI4CO
 aAwQyiBpRqJm2aSas/Bd2zGDbMBobaUbEScVlSxPMJ43fLQ2wgy9oTY7UmTRoO1hqEzY/puz0iw
 OsgPEDG3KY7ck7uBHnCqqK+rX+Tf+rxWzeClpghGt5PzKsxozqWThFcGkWThc++Ju451IkI8Nc8
 VVUuqIXyuoDMsdffpkvN5aTYRWef35RTpxFUUYF29OLGLf1QACj6gWb08LLgFbBpxJtEuM5BvIY
 bB8qIfjV5WyI5bS7EBw==
X-Proofpoint-GUID: iOSC8RJvUE9Ok4Xw__wC9AqAmNDTWXN_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfX5ZdFSSq3rinu
 axE17TsvTCe04gkLfp5H7kAIrG0fV+v7duTW22c6glH43HWaaAcmRngoYGQi4xwUHy2Fs/bLiQl
 99TOXPQSgjDyCxCsCPTa7Ho8oMYYVmc=
X-Proofpoint-ORIG-GUID: iOSC8RJvUE9Ok4Xw__wC9AqAmNDTWXN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200028

Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
walking the dp_peers_list, resulting in O(n) lookup complexity. As the
driver supports up to 1536 clients, frequent lookups on critical paths
such as TX/RX processing, peer management, control operations and
debug/statistics handling can incur noticeable overhead in dense
deployment scenarios.

Replace the peer list with a generic kernel hash table for MAC address
based peer management and lookup, providing O(1) average-case lookup
performance. The hash table is implemented using DECLARE_HASHTABLE()
with 2048 buckets (2^11), derived from
order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
over the peer MAC address as the hash key.

The hash table is used both for address-based lookups and peer
traversal operations, eliminating the need for maintaining a separate
peer list.

The maximum single-radio client limit is defined as
ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
params. This keeps the peer hash sizing aligned with the per-device
client limit and the maximum number of devices in a hardware group.

Key changes:
- Add peer_hash table to ath12k_dp_hw and initialize it during
  hardware allocation.
- Add hash_node to ath12k_dp_peer for hash table membership.
- Introduce helper APIs for hash computation, insertion, deletion and
  lookup.
- Convert MAC-address-based peer searches from list traversal to
  hash-table lookup.
- Replace peer list traversal with hash table iteration.

Peer creation inserts the peer into the hash table, while deletion
removes it from the hash table. Peer cleanup paths are updated to
iterate over the hash table and safely free peer objects.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Changes in v2:
- Rebased the changes
---
 drivers/net/wireless/ath/ath12k/cmn_defs.h |  2 +
 drivers/net/wireless/ath/ath12k/core.c     |  2 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h   | 14 ++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.c  | 47 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h  |  7 +++-
 drivers/net/wireless/ath/ath12k/mac.c      | 20 ++++-----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 10 ++---
 7 files changed, 76 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/cmn_defs.h b/drivers/net/wireless/ath/ath12k/cmn_defs.h
index 20208ffea1c9..15c5e8d11afc 100644
--- a/drivers/net/wireless/ath/ath12k/cmn_defs.h
+++ b/drivers/net/wireless/ath/ath12k/cmn_defs.h
@@ -10,6 +10,8 @@
 
 #define MAX_RADIOS 2
 #define ATH12K_MAX_DEVICES 3
+#define ATH12K_MAX_CLIENTS 512
+
 #define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_DEVICES * MAX_RADIOS)
 
 #define ATH12K_SCAN_MAX_LINKS	ATH12K_GROUP_MAX_RADIO
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 719200759ca0..6e0bb1fecc09 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -44,7 +44,7 @@ static const struct
 ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 [ATH12K_QMI_MEMORY_MODE_DEFAULT] = {
 		.num_vdevs = 17,
-		.max_client_single = 512,
+		.max_client_single = ATH12K_MAX_CLIENTS,
 		.max_client_dbs = 128,
 		.max_client_dbs_sbs = 128,
 		.dp_params = {
diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index 88abe90767eb..ff011fafc175 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -6,6 +6,7 @@
 #ifndef ATH12K_DP_CMN_H
 #define ATH12K_DP_CMN_H
 
+#include <linux/hashtable.h>
 #include "cmn_defs.h"
 
 struct ath12k_hw_group;
@@ -18,12 +19,21 @@ struct ath12k_dp_link_peer;
  */
 #define MAX_DP_PEER_LIST_SIZE  16384
 
+/*
+ * The hash table supports ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS clients;
+ * order_base_2() gives 2048 hash buckets.
+ */
+#define ATH12K_DP_PEER_HASH_BITS \
+	order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS)
+
 struct ath12k_dp_hw {
 	struct ath12k_dp_peer __rcu *dp_peers[MAX_DP_PEER_LIST_SIZE];
 
-	/* Lock for protection of dp_peer_list and peers */
+	/* Lock for protection of dp_peers[] and peer_hash */
 	spinlock_t peer_lock;
-	struct list_head dp_peers_list;
+
+	/* Generic hash table for fast MAC address lookup */
+	DECLARE_HASHTABLE(peer_hash, ATH12K_DP_PEER_HASH_BITS);
 };
 
 struct ath12k_dp_hw_group {
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 4e753e6abe3a..5dc7f08e6292 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/jhash.h>
 #include "core.h"
 #include "dp_peer.h"
 #include "debug.h"
@@ -371,30 +372,58 @@ void ath12k_dp_link_peer_rhash_delete(struct ath12k_dp *dp,
 			    peer->addr, peer->peer_id, ret);
 }
 
+static u32 ath12k_dp_peer_addr_hash(const u8 *addr)
+{
+	return jhash(addr, ETH_ALEN, 0);
+}
+
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr(struct ath12k_dp_hw *dp_hw, u8 *addr)
 {
-	struct ath12k_dp_peer *peer;
+	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(peer, &dp_hw->dp_peers_list, list) {
-		if (ether_addr_equal(peer->addr, addr))
-			return peer;
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
+		if (ether_addr_equal(dp_peer->addr, addr))
+			return dp_peer;
 	}
 
 	return NULL;
 }
 EXPORT_SYMBOL(ath12k_dp_peer_find_by_addr);
 
+static void ath12k_dp_peer_hash_table_add(struct ath12k_dp_hw *dp_hw,
+					  struct ath12k_dp_peer *dp_peer)
+{
+	u32 hash;
+
+	lockdep_assert_held(&dp_hw->peer_lock);
+
+	hash = ath12k_dp_peer_addr_hash(dp_peer->addr);
+	hash_add(dp_hw->peer_hash, &dp_peer->hash_node, hash);
+}
+
+void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
+				      struct ath12k_dp_peer *dp_peer)
+{
+	lockdep_assert_held(&dp_hw->peer_lock);
+
+	hash_del(&dp_peer->hash_node);
+}
+
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr_and_sta(struct ath12k_dp_hw *dp_hw,
 							   u8 *addr,
 							   struct ieee80211_sta *sta)
 {
 	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
 		if (ether_addr_equal(dp_peer->addr, addr) && (dp_peer->sta == sta))
 			return dp_peer;
 	}
@@ -408,10 +437,12 @@ static struct ath12k_dp_peer *ath12k_dp_peer_create_find(struct ath12k_dp_hw *dp
 							 bool mlo_peer)
 {
 	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
 		if (ether_addr_equal(dp_peer->addr, addr)) {
 			if (!sta || mlo_peer || dp_peer->is_mlo ||
 			    dp_peer->sta == sta)
@@ -517,7 +548,7 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 
 	spin_lock_bh(&dp_hw->peer_lock);
 
-	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
+	ath12k_dp_peer_hash_table_add(dp_hw, dp_peer);
 
 	/*
 	 * For an MLO client whose ML peer ID is allocated by the host, the
@@ -555,7 +586,7 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
 
-	list_del(&dp_peer->list);
+	ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 2ac4c6c6d535..0a2b9d1814a5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -127,7 +127,6 @@ void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
 					u8 logical_link_id, u8 valid);
 
 struct ath12k_dp_peer {
-	struct list_head list;
 	bool is_mlo;
 	bool dp_setup_done;
 
@@ -164,6 +163,9 @@ struct ath12k_dp_peer {
 	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
 
 	bool use_4addr;
+
+	/* Hash table node for MAC address lookup */
+	struct hlist_node hash_node;
 };
 
 struct ath12k_dp_link_peer *
@@ -212,4 +214,7 @@ ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
 	return link_peer && link_peer->dp_peer ?
 		link_peer->dp_peer->sta : NULL;
 }
+
+void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
+				      struct ath12k_dp_peer *dp_peer);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a247dcf387de..51ee44e72abf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1277,16 +1277,20 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 {
-	struct list_head peers;
-	struct ath12k_dp_peer *dp_peer, *tmp;
 	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
+	struct ath12k_dp_peer *dp_peer;
+	struct hlist_head free_list;
+	struct hlist_node *tmp;
+	int bkt;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	INIT_LIST_HEAD(&peers);
+	INIT_HLIST_HEAD(&free_list);
 
 	spin_lock_bh(&dp_hw->peer_lock);
-	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
+	hash_for_each_safe(dp_hw->peer_hash, bkt, tmp, dp_peer, hash_node) {
+		ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
+
 		if (dp_peer->is_mlo) {
 			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
@@ -1294,17 +1298,15 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
-		list_move(&dp_peer->list, &peers);
+		hlist_add_head(&dp_peer->hash_node, &free_list);
 	}
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
 	synchronize_rcu();
 
-	list_for_each_entry_safe(dp_peer, tmp, &peers, list) {
-		list_del(&dp_peer->list);
+	hlist_for_each_entry_safe(dp_peer, tmp, &free_list, hash_node)
 		kfree(dp_peer);
-	}
 }
 
 static int ath12k_mac_vdev_setup_sync(struct ath12k *ar)
@@ -15530,7 +15532,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 
 	spin_lock_init(&ah->survey_lock);
 	spin_lock_init(&ah->dp_hw.peer_lock);
-	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);
+	hash_init(ah->dp_hw.peer_hash);
 
 	for (i = 0; i < num_pdev_map; i++) {
 		ab = pdev_map[i].ab;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..9f2b1dddfdb4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -488,7 +488,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -587,7 +587,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -682,7 +682,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -871,7 +871,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -963,7 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},

base-commit: 03b7c601b6e314115015a57061f5b377afe13190
-- 
2.34.1

