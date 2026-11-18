Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970568;
	b=Tc1fOyEJCijHFOuK8/pNG4sn/pIzQDS1rHTJqIk0Of/JQeZkDPpQxNjTkt9WBIIZbVO3
	 wVXU4IdHCFFovCDXfwSQP7oFjgNGVShvdMFkZjAK9O9oamS4hbTTUvgxoKsK/inny2s0m
	 iIJnaTr6TqlAyH+Po5mjMkmF22iUviF4I3/DeWJMtmWSaFuMIuKlkb0nvuifQBltW30If
	 F7sHa+3Ve1yJNtA/u96xVPue/Tvvolx2Ys4ijH0ZuxvidGemYST8Cc3P6wbLNK69hwVrb
	 N8ATD1VXisbcOIRQxSFw60RimiJBHhh7bCGfIX6vURl9G8cxZ2r9JXH1FamV89JHXBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
	b=lxSijt+1IT6iFlaQ2qmxInymZirGGeQXGlh6Jc/vK+mCC90A8jDRjjEEwMMLDW8fgAkT
	 3UyAyK5pjz9JCpDSGXCfcfOOus4KOKj3UFiGFyFE9K6QjqsUe8SYljMu0qRJIqI6+PCNx
	 zL5m94S1m/9R6vZxXaVOlyp0EbuTLl9vGYRkX/kcXc1fFTe9n3n4kmONpcEg+UcIPJrXi
	 sZ2L7KsrUD+oIO6DPPqj/p/423ofpUeshyPPH5Q21Ph2l1XnS1fd8Jnjluo22m0h9IGyn
	 KDEVMuyd2bgMoz7+rLaDqvYf5hAqtxqGWtEqZsDcrioEGzw2QMaAk6PeIz/JCjWIs/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnUpZZNI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9+o4TsR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1C606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A1C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnUpZZNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9+o4TsR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V21x2106321
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBw
	c9cQbRWA=; b=gnUpZZNIsdUC13YA4pt34bt0BVyTZC5Q3gRtl1AoIbzlGG1qXF+
	aTmcM0nu5OAA2KERuC5hr5Bda/sSNVeNNyNcCYMJf1GN57uahMkPW652kL6JEiSB
	Af2PXhPxroCgzPEav55rz5MPw76fLebcKhgrcmgT7G1K8IweaMedDmOKTHYufQsC
	NZ0xR6R2CKlxo3nETRt5BMED0cW0Aoy1m/8hf4OjCkE8EfcOREAaYNR8EaKQau0y
	Fx/KgXZwZtJStgFD6QKbsfBLIqQtr/VEso3PiN0zKF9xjyYIAgOKy4agcYtOLiQP
	yjIXSkJRxKur69I8lqU/Kh48c4IToV7USSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rtkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:55:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efdc35736bso6738365ad.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970558; x=1795575358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=O9+o4TsR/NxHZrDnHba5e5FzG2SVkTkRRPAMGz5CODxuwb2YjeiAoD54A0AZ1AAPjw
         +lol4s/Zdl9EiwtCZ6YvQDEUsUC1w0EeGw71qoEI5AOqGNWoQ8FueWS2sKOXEfN1CCF+
         f3btytCmctSBbJFleCxT2GI9q2bUBNmNyYItzDsGc1GvVbkSNuBvNurtetrEsXhWcrif
         4O5Cq9V5zegpHuCX8QqensJTTfu1Yj9I3vJv+y6Ib30Tm6Pyi49uRvVoiLMth00rDZH+
         IYcrQcvO1lKUrUjL/e5EzOTb9qw5EjyyRmSBo9vuRzQTlOOBkw2hX3ToEicv3qFcEQeW
         HTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970559; x=1795575359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=CZ1qOnbEWGwW9jKYIe36+AfE5nw0fVcSx179Wrtut5TmoRtJEgqjd11uc5xwMqlxWB
         SYKzrYvE3YzQcXiq/BNToqQmhrD5fA5geb1o09zTWq7uWHZz1KwblUQWwqy7RCGHfogd
         z9oxx4xlZeIZoDdh/ErMDICRsIdGmjL+on5qvWMReAEnjPxgQQVQ+x9wMYK9El7qHQS0
         ddhCs6lCgam78xuvCcqYsHoX9lsumBU6lAmrhZX0Osh0/DxbKhu1PXhIz5Eu1jbb3lt2
         lXK7UKdrYlFi+31Jcj5VD3Au/44MdBrDOJ9AOEqyv0LC+MY/d9/weMJGnteM3zb7rifG
         z3tQ==
X-Forwarded-Encrypted: i=1; AL+hErGGSSdF/CIGQ+A6PDP8fDb8ZQMF99LUDodPAhtuGI+pGMCejLtAq/9X+uMyKnxqM34oycPmMD3P1seHwoW8tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TO+DV3Z9JyRywXy1PFkFHXtKrLkp4kQHOZ6J1fXz9knkdY2mN
	3ywAYOcpIZ8SiLrs6TJ6uxfbybK3RLJylgMj2UMe9Ai6LyS0L8KK+43Lx/I9FtRb+8Am9/YaS+g
	Ycl1O50sw0vXiVNZPwn/5bD2Fj9cafaQ+BRQa8JGOV38jhAC+txlWMHSPG2Ndo7Ua6kIpFg==
X-Gm-Gg: AZFdTZfMz2qovYe88Inq3NBKeV3kB53+OZkYZauaqo5+o6pRPjCiPFcoNce+T4ejHNe
	eCYhjE1AoLCxxwCjYyAL59xWubzJUF1Go5Ab+o4VPQvpibDrqXgAXZ2NggANwvCgipEEZ6S9lmu
	ONM4WSFiyuojmRWLH13R1KA1CX5GzKmTCmlFymHAREwAu0nQM6ImO+mi2+OHsDMpYsqVHZzTmHJ
	L5AcTMdYsgkTroyq2ipN+CjnXwIMWuw+J48enGLLEIQQZC5yN2P069x6/AINKitYxDBy4u4z0SS
	Ai5WUnmUy8+v4gM+CcX8v8z8ScXQzpsonRyHe0VEHntdTZXXRRZu2EC800eY7Yk5jQDANqrI25b
	vbhAZmFQ+3wevxqC7NLCqOqXAtgze/uV0AEUWrr4+Az3v7qlxli+mxy9000w4DujB6UW0n1YuKA
	tHKLfKoww5VfPN5TSuInpgzzDTxhD8+dE=
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276635ad.35.1794970558457;
        Tue, 17 Nov 2026 18:55:58 -0800 (PST)
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276405ad.35.1794970557932;
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
Date: Wed, 18 Nov 2026 10:55:13 +0800
Message-Id: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EJJqsReinHrtl4fOGbqfkNod3aLcDqMz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX8HkFSpKjQnZA
 TDJ6flA7s6FD6J1bPp1pFSmAb33xIpFEzWdZdjRgrPtR2b48RYBR/lj+gFrw5PmpPlHbeWRbwpW
 nL66JN08rRZvmpAnLNrZtDTmmkNUIBY=
X-Proofpoint-GUID: EJJqsReinHrtl4fOGbqfkNod3aLcDqMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX8iDS0hBOVaTk
 fc3ToUpz7XN8i51cb/pGobVVe/J/71QrrnoEMQjNqVxeN7Gaw2WjbvCpapU6+sDHebkNmgPNTSe
 dhNn8ln3afZ8Ng1+vG8sFAgFtr43zYAfexZcVUx/H8OUAVuLYxpQFRAFjJrdxpJ4hTzvinhpg+i
 +M+XUw2IKVsnb4mqTsSHutHGZBKx2PA85U1f3vxqSF2Afp6mSwFyE3erDDSKRJ/l+z5jtArUZiv
 xhuIaw/3pdv8d6QIIjp67v8dsI4266jlAxLmgEatCtE+c908YZU+najLuaBSLNgUIbSJWdg0L99
 Z5kZcoLmf0j+WHVv2KIvyi9cPgcy0B05VKEU6Lz7rhLJSmkGE5VUc8ngHdmOa5aEkY/r28yZwEh
 UsdFAsWC/VL5Ru8WHrYuEQAG9ua0kWEvJZzw8XAA7LX6N5b6WcoXhgAlUCty1sCsWsrOk0UgOUV
 YN9ZQEh1xD1CzTYtAjA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd13bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=6kQku5dBW61KixfneSkA:9
 a=EUlzmMyR4JpyyxVz:21 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
both valid-links and active-links changes. ath12k does not distinguish
between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
inconsistent vdev state in the chanctx callbacks, and silent
firmware miss in change_sta_links().

This series derives link object lifetime from vif->valid_links and
sta->valid_links, which mac80211 updates before calling the driver,
instead of from the active-links sets. A STA link vdev keeps running when
its link is deactivated. The active/inactive link state is programmed to
firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
holds vdevs of the STA, and only when it differs from the state last
programmed.

Patch 1 adds WMI infrastructure: the response event struct,
WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
registered in ath12k_wmi_op_rx(). The handler only parses and logs
the event at this point; delivery to the waiter is wired up in patch 7.

Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
firmware replaces the force bitmaps instead of accumulating them. It also
copies the AP MLD address into the command, and fixes the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
follows vif->valid_links. A link that is only deactivated keeps its link
vif, and a disconnect (valid_links == 0) removes all remaining link vifs.

Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
context. A deactivated link keeps its vdev up in firmware but has
released its channel context, so it must not be used to derive the
target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
is kept.

Patch 5 stops clearing is_started for a STA vdev in
unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
keeps matching the firmware state. assign_vif_chanctx() then compares the
new channel with started_chandef: if it is unchanged nothing is done.
Otherwise the vdev is restarted on the new channel, or stopped and started
if it is not up. Station removal clears is_started once the STA vdev has
been stopped, so that a reconnect on targets with vdev_start_delay starts
the vdev again.

Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
The checks now use the constant of the array they guard.

Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
sta->valid_links that are not yet in links_map. Link STA removal is
still left to STA removal, as firmware does not support it. Once the STA
is authorized, a link holding a channel context is active, and a link
with a link STA and link vif but no channel context is inactive. The
result is compared with ahvif->fw_active_links and
ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
when it differs. It is sent to each device that holds vdevs of the STA,
with that device's links, and the driver waits for each device's
response, except in the INACTIVE_LINK_NUM case, which is sent without
waiting. If a device holds some of the STA's links but none of them is
active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
ath12k_core_pre_reconfigure_recovery() releases the waiter before it
takes the wiphy lock.

Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
from patch 1, the ap_mld_addr argument from patch 2, link vifs that
survive deactivation from patch 3, and a STA link vdev that stays
started across deactivation from patch 5. Patches 1-6 each apply to the
base on their own, and the whole series applies in order.


Miaoqing Pan (7):
  wifi: ath12k: add WMI response handling for MLO link set active
    command
  wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
    active
  wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
    updates
  wifi: ath12k: skip links without channel context in
    ath12k_mac_get_vif_up()
  wifi: ath12k: restart STA link vdev on chanctx assign if channel
    changed
  wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
  wifi: ath12k: handle MLO active link updates

 drivers/net/wireless/ath/ath12k/core.c |  15 ++
 drivers/net/wireless/ath/ath12k/core.h |  25 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
 5 files changed, 405 insertions(+), 35 deletions(-)


base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.34.1

