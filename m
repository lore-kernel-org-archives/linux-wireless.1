Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684854;
	b=svFp7hsc/uN2hg690L2SmfEXJW2sQybk2HTe0hyGbrdT2JzXU2QTsZZ0s6n/OkVwMxrz
	 rqIt6BR3STazTv4Tqtw6e215S+wRGoTPKShBjOtBV8/gGCLUOHOJFkByD/cNfsWFCpOFn
	 H1KhPw/4kelFeW0CvMFeuw6FCvTs0kKJ2cbE8iuDqgAtVfb9BqYv82gXExvkueEIYIKlX
	 PA/9FR+lVJmOngsxlYPY+rIDsXruEBuT7dIBqRa/st3mHnZPGM9zPGj/YkUGn+fLITfX6
	 IdDukPilh8DgaleYyYR19B5b/ik/GXvm2dkMTWowBio1kgIxv/9H6gmeZ+89mURp1pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=;
	b=xlAw5i5hV4E+4EaO9FPieHps6kZP5AWFeUjG15RKrvjNSHgX3ZyhBlUXCq/WfmP0+Onh
	 b6uZcVWRp9CYl+BR49KNu16698xeGWbMk4XK+OLEVLkyltX3ddVDFcUhn2DiMUupkhktm
	 t+1DafBHgbZzk/oFhk4f+p4u5zLIToKbjKNm/Iyc57emFbPwUysVXKdhWRT1wssnhrQpv
	 a5gH36jUYe3WugH0kG1zWKR2VjM2HOFT31v1rsMqQOEl1NTUN4w2njI0hr93Z3bZaXRKD
	 9CL2m5QUO4s16zIgHhV0bm26JVhgyTz5KGLC5JwbZxYy/wMQKriWSci7Ms8ZXspypfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCGaAPYP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LW0EppOb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB2606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCGaAPYP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LW0EppOb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4et2210830
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoP
	RrdyLxkQ=; b=KCGaAPYP4YgqNEgY/t0aRjDd/5mbnE+zGUYhDNPDojmXIGjh5PA
	8B61+JJsXwMYQEx45XsTvP0QiLvmHVI9JYMorWieNd0orNn5vI9hvoAf/1/s3fE7
	9z64ieuP2GoYFhhmhrPD82MxzkymFa+ataN/VKZgw2taksuirjgnMy0ZM1EwRG1K
	uGe187d0eZOyK6MnZyHY4NX+UeHlAbgXsjF/XtHZTIBf75LcFXKWGqx2wgOCkjZm
	BqEnS5R8pfDKSE88+P0JC2WBcey5yTQJbUHS1Jyh657kpGcdYWl5o+QfbSOIOBnZ
	TTIh2CFSYSVF/ms7aGa8dP04qEt/4XkoAWA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfa88n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so7016188b3a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684851; x=1796289651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=;
        b=LW0EppOblv9q1GQRMnCymFwKeBEMkx4cjeFGTquh9G9d+KvkeQ1widjqISnsL0aapw
         Qe/rcaaNyDV8qZEVFsPcCavikDAWKgzudvteSaicRQAAqagQ7Zx4ef8hXOTn11R/XSyr
         HM04uGHtEWwxoCzNd7xtmh4wvLUFvE0slPDC4L6uRLO4akb/ayiPRnsCBHutmxaygWAO
         sNE31h7m/ASnnDb1fm8//9QQ1OCwxzAC/t/gRzuSH3euX62l2iIp1Oc3vMqG6HfEmmkQ
         W3SKu9kDWlcu7GW6KEXPvgZj4naChTcI0to8LAp1NaZlIX+oRwwwjUxPFPpFDYuvRrlu
         K78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684851; x=1796289651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=;
        b=qEz3g5Xmx/ccz97R0d9SIiMOJCKHpo5HsHLTVRJqjrWwPepvTYzGp9tEWa6n3zjiGb
         fVxiciM8Dc1UeLNwdqStg39kfLf7IdvxBk2YHCplR5yINPgSyTjW4LAOOWs5klAZ3d/E
         J1nvo0XfFUVFSmYsmRctTo1zvO3bjunLoQpm13C9GpR8oYmmvkB26HLwm7PUpj8DQiLS
         419vQv67uZi5aYd60Oj86WapKF02P05tpuUTuyR96nQMT/UXMZUZpqbTEwBo+IVIqRPm
         oDcB3a6hakaqpQtZw6ooRMKQZevDoxUZ2PmuDsAOdNKgQTJOOdcp7egeSdiVp3L7kebM
         qQsw==
X-Forwarded-Encrypted: i=1; AL+hErFRMX2y+oZX3SLypLfrgT/kDhGAonVWjFzOAqLIevcLSm8lM6NKvyNfOK9Rp0r5M+Wqogfvo4fdzk/663Uh/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z831j66jG8VNRaDMF0IYRJ2Qzz0qFfc0i9YFE9hGIoqLEtrmzVq
	f0sd6llNVbI7Ttx58QlS4BEclzU477GQCHp5vUeyvV68i8tCDQqmtev7M2grRHX8yGHbF+BC0SU
	0HiTqjaIAd6nlBWyLSGmtX0rQr6iSdIaRHlT3Hl+IAR1x6dKhUgirEUbpYn91Vmacju1Y/w==
X-Gm-Gg: AZFdTZde2xg/S8LtwuRTkX+DBwJ0TlGGjrY5abFdPHmS80kffcXawKoyRvTY6jbXqIq
	TZm01DHahjLvmDVG8ouVRn4mb9uaDoBYnFXgwN6/BJyJfPTXYpzA82faqyMFNZWe6kUOCDVFRgl
	nqKIZ/DM3o/Apfv1qJNU2bk2gOakMOSMIjCgDn2JcUpewoR499KIbhfoMG1RZW+5EbpjhN2zhg1
	7CYua1iV5DlIyGRtfpaV5GWsfpEhGCkpNG8/RJ/rr7a8I7lf/d+WCCeTcCRTFiYHH3A5dow6OsH
	ex7kck+/GQQyXcMi0In7dnkYq5ju/gXBS6LfITz6wdpch2yisS+zFdkv5YltO/ZKrVZRDImx7K3
	/bO7hQa+Z6T9x9sZGTifkWaMGLII4nIALYPJN+1RXXla5DEQA+0TuXF8g/fbvVm9hRHBfhToq85
	ornY0Ynfc5tVeZwqIWVKR6MiO3P+nm4Mc=
X-Received: by 2002:a05:6a00:2d84:b0:893:1336:4809 with SMTP id d2e1a72fcca58-8c87cb48d65mr18707852b3a.47.1795684851011;
        Thu, 26 Nov 2026 01:20:51 -0800 (PST)
X-Received: by 2002:a05:6a00:2d84:b0:893:1336:4809 with SMTP id d2e1a72fcca58-8c87cb48d65mr18707833b3a.47.1795684850492;
        Thu, 26 Nov 2026 01:20:50 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:50 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/7] wifi: ath12k: fix MLO active-links handling
Date: Thu, 26 Nov 2026 17:20:30 +0800
Message-Id: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4v5VJhG5zoXEWHt7n4v_9GyKfvuMW2bz
X-Proofpoint-GUID: 4v5VJhG5zoXEWHt7n4v_9GyKfvuMW2bz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX6Ljd8Nyau50T
 gA6bUV56WJ+4hVA744una0uQLSJ0E1vnD1yZQrbWQ2uhBW4GvsnmFhc2yelZO56FuyvyjUUU35/
 SAC9yL4EC/LsvHVExrs+niMk1yq7eKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX5QtuqmiDniUY
 A4BwG9mlR/KiCD0XW5i1UvggINHf7SNEhrDnQ5pt/l0QS+Pv5CpYJnbv1sz+3KKVChl/s4NvyKB
 vueoa2ALIso/WfT2P10SlP4fkymfKAedp3Cb6rlusaRgM0xypfVJx7H0gmKgNQxRozCYwxdCx4n
 SqyZlyPiBhsbip2ZF4BjCAaPyudW9dH5QKWbwOxQaGTdPiPnEA63EUXgzWMzWnkUc0TwWJ3i2Nq
 rsobJpJLjR4dUGyolR77sW/N4mJ9l499Ct5RUczA8i2Ty40WbSXVSI0R6Xc3WIaSrKW9bS9CADr
 Ee3pCLt7mOgGN/k1QLBCS9IVJ4hwH0NIAsYdstV6/zX5RDjSKGpRd0/rqtSnvlTljRnYGl7U2U4
 yHzeHH9UdrhllRuJSYDDAPVXbmOHDlJmz0PnjZC9LGwEq0cB454pFKIzegJGvQzIdpD9nPOkJPL
 feweUij0W3fBZRpe46Q==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07f9f4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=azDT-4wkt-qAIGEF8nUA:9
 a=uT92G05FbF0D0Hrg:21 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260035

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
waiting. Before anything is sent, all devices are checked. If a device
holds some of the STA's links but none of them is active, firmware
cannot deactivate all links of a device, so the update is skipped
without sending any command to any device, and the cached state is
left unchanged. If the device crashes while a request is pending,
ath12k_core_pre_reconfigure_recovery() releases the waiter before it
takes the wiphy lock.

Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
from patch 1, the ap_mld_addr argument from patch 2, link vifs that
survive deactivation from patch 3, and a STA link vdev that stays
started across deactivation from patch 5. Patches 1-6 each apply to the
base on their own, and the whole series applies in order.

Changes in v2:
 - Patch 7: in ath12k_mac_mlo_sta_sync_active_links(), check all devices
   before sending any command. If a device would be left with no active
   link, skip the whole update, log it, and return 0 instead of failing
   with -EOPNOTSUPP. v1 checked each device while sending, so devices
   handled before the failing one had already been programmed, but the
   cached state was not updated.
 - Patches 1-6: no code changes, rebased onto the latest ath-next.


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
 drivers/net/wireless/ath/ath12k/mac.c  | 345 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
 5 files changed, 415 insertions(+), 35 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.34.1

