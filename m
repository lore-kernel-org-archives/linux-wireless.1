Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970572;
	b=JR7aoyoISZr1LmrP7ue3c497JmBdQTp1+0cQxskbh5/A6g5gw4n4C+SqXUP7JGAxcRZg
	 ueS9LJb5eRKhVjH84ueeRTnkGtLuIPO0ULIitcfl2Jfz5gTycjmnUk+P1p3vwFUH0W0u2
	 603agCuiog+rYw6n/9+aYqzk2cj7JMrY63iUDzpQfa8gDbnQ45glb0ntKWg+EgJUpcD/+
	 cOgf3F4Hc4ehwNjLjJTrW5jG+rhtxWxvZqG8pxXZPDVl6VCk4cdIHhQE1B6Yco6j7ycPz
	 rR5+gHeHeJugJn3H+C4HTMHYWzLyMg4yAI429zdFpSPvTXJkOkb3qlMcMtOIqTTNUDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
	b=Ex3KNCzAhe21algUGF1DC7QR4aKkuAmOOXC53RMmb0ryu7H2wJPi9O9z2deoyCwrcSHI
	 7urY+RqDnNkhJMW2WW2EhVB9VOso71z2q+OBU2GCnPPwJ/+Ug3Tef7+IcQMwwYYQ3Tyt9
	 06C1v4W3XDBAjCYLPdAootlXExxFGhMCd6KtVDvvdk0/iFnOmDX691JaFSIJ9daX9IWvj
	 NoWWL3iqvLyO/N9FHye1Lwqgs/AYp431wxDYSfh07aW9TvTXmFxTSZRSIIa1ZUT+NvJAW
	 6Y76mYgxQ3RqhrKUecsPytWon/syxsO2A7GSiCSBLt/tWcKcW6y3V1C5x28yPUcmtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoWpdo95;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB3L7dyP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611B606A88C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9611B606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoWpdo95;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB3L7dyP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0hY2453700
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BdiMUCt/wyu
	L4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=; b=RoWpdo95Z7IszKqYSQC91b+Z6jz
	6HN80L9NirWkjHXDyryR9i9r9wyp+uSW6mbeQCECjQXjJfWfW5K5Rha8dYxXJAb/
	pa84IZvqelZ7Dm4HsAXugu3kdVqwL2UJyi0Icpvu6Np8WGBXy63OnnEZmfpduKf6
	z6Wsq8SR3YYJREyTQE31G/z3Z1v9OKV2k6X3mYtBku9W8R9Pchat9WFhBKc9Tu2Q
	EGzHQ4NsHgwWIkw8x7l0Xyt4mszKYtDmabNLQ2NwcfuncAOQB19nlhONZ+ZSjghX
	kmgKc1gwF6hpfUSKMLqmSIzudX6VmAYKkGhNmnQQDmxQDP6VrZNNVlgDvkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv98uae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so335536a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970563; x=1795575363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=ZB3L7dyPk8q1AOJ6AqNBFZOFrXhmURl4cNUKQNWUVfM7z/NrExTcaorObe3NsQrtZq
         rF0+7UQvOwwf4A9RuE4pFfqP9e/jpdbtv9a3VTeRh0C/viymzm4VWrw2UGVxEvOhngiQ
         sBjCzbpiI/5VYUD9yyImoxxJCdhoJkhPh/9r6QGMrn2ihK8w9dTOysHmfOsbTT3c455u
         vMzNOId2W+yFiZPu3jkvtPK8p5Ho02IydFxjVTKTnhXg+82As4BJIfM1+bsXocAelaaG
         wcg8VMdgR6dQ6cMHqoyDyBUJtqn4oeRY8gZawuAxb1WfkDX1InEXH58pInnBBnNafQFv
         hovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970563; x=1795575363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=hyRmSxVQN5mLSRsbF5Tdyod0dufkQddJ6JFDc4HoFkPqfumwsq6hr7xhAyZr9BtyUr
         JZwDTS06d5/uOh15bqLGdIOfSPhYxch9bS3545o/PDEVvgBRsleknTnbzPsxWKQj2A1Y
         z4atmCaBRQlIEJOfnMs7UvBNeIOsaYVO51YdamvqbjWCZV4A4LjIUZQjMqKYqrR5Bf+U
         sTMvpFCd5aDoJ7qK5uJIvkyWa9PDtyUmwxX0kYVcQdsbh+YucNiS37C6BcZ8ERTecqVc
         lvnAaGm2RMz7c4Kz3VAlwI1qergwXpxIP82lWkoAlOSx/87bfzEZ6YwcCHjmQVbTzM92
         McyA==
X-Forwarded-Encrypted: i=1; AL+hErE6YNVZycraUWl2dproiv9deGJ4yIuf3TRxS18LGu8NJCermeHPpBykQ4uBiWch28E7Rlk0jiR5NoI/0wiVsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cmaLzG5PoabA9DKfG6Vnbw5P0cloJFhGERNnAoC54Xm8JGqlQ
	Kb3x4GtJ0iRDisYPGNLyi4HblCfxiBlKKh1XcjqMGCTUFzOaL9EsRQ7ZfqhHJZePBNh3lWyBLUe
	IJlgZi7bjsktcBavF2k4htL44YfFzPhTgSKXVE9jaqCPjeYjtboGVPucULMF4VXKFf9QKUA==
X-Gm-Gg: AZFdTZflYuBoa+xsRmScJzFGquo6sxzqIQnh3aq1M4It1OsMM2XwzKdfnyaBcxYPGB0
	0Gn4SECM3HJJM6CTqwo+Z73UYDNi53+SF59PIOhoOuHxiawvzvNRHOjVFLmKWD2aMRnkzY72viD
	tD4noBtfG+Np3CsKMtuzD7RF8FBSMqhPmUH0wVFoBZ18VviCkV6ltNEUtrYDaKT6H62sOFRpKgn
	jpI5nDSqRd3hSI6VmHK5o1q62zaUCGAVKTavmtDO3RmA0XZTXDO5TaFa7rXFKq1iJapn4gQDV0h
	dF82eF46II3NYO8hDT3k7GTnDjAhOCm0UkLANFsHkj44VmO4Ec4H32mi2fHncpsP9g9B1wyzB0B
	BCQj5D/r+e0akhf7vWCHl7qFaziPaRPGU1XcmjYAP6U4MkzMSaknTPWhE5JLqu+iCjPcGTYdRzn
	FSKMxa65ebd3vxvrl92xRnFhoEl0fRStc=
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097840a91.59.1794970563245;
        Tue, 17 Nov 2026 18:56:03 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097810a91.59.1794970562570;
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/7] wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set active
Date: Wed, 18 Nov 2026 10:55:15 +0800
Message-Id: <20261118025520.39269-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX7tYaRto80BeY
 Lu5VjQOPu8VSuG344tF5u0QJm8L752PSBViBGii1omDs98+Kau/49sQcHvkOvJOfnEg+wBmWucy
 tk+gNW/Z1rfYd5/YMHo5nMLQstIoD/0=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd13c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2wyP5r7tFOAPNzKROpoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX9IXkvJ3Uz+rm
 TP7/KLQJiKxpu8f10/BCUUIKCnqzYLJeDpLG3FIY31iGhfKs5SlF6VuDpJyd2DLqu+TDR2eRuwy
 oJkl7cQkEnO6fffghboxwcpZHYCd+BeXzNUeItXq0hWkNDWqXl/hdjcTlp2FQiwpdRjxOskYZ/h
 RLq9gQzK6skIxORyIzTcbO3tFJO2B9gOX8evPcN4PAYV8KI+SHOksa7J4fUwahrqacV94vryx//
 IA8/LFN0FpWZAXkOF4tqMUgC4JwWci9OVMv4g4s0fqHUg+/h+Cf5q2BIKdoHTkfzo5ZktBMvaYR
 13yG10zZ5IEr2tJ/TzcpLig52E5kq9yzjZooNe4J1ILYE29aL27H0baRQrbApvMA+HIOSimMgHX
 66W/XfV20sLInRcYedxa2PSfTQRH+UNyv0XQt/0+YbOE8UT5ar3OKWdKa/EYkJS5vI22cFtfjop
 eBlnk4EO7OCKVGPQAHA==
X-Proofpoint-ORIG-GUID: iTIEhohjFQijR0u87NkBMi67gklIWqp-
X-Proofpoint-GUID: iTIEhohjFQijR0u87NkBMi67gklIWqp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

When CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP or
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP is set in ctrl_flags, firmware
replaces the existing force link bitmaps rather than OR-ing the new bitmap
into the accumulated force state. Without these flags, successive commands
accumulate: forcing link A active and then forcing link B active would
leave both links forced simultaneously, making it impossible to clear a
previously forced link. With the overwrite flags, each command atomically
replaces the force bitmap, giving the driver precise control over which
links are active.

Encode the two overwrite flags in WMI_MLO_LINK_SET_ACTIVE_CMDID, and copy
the AP MLD MAC address from the argument into the command. Also fix the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

ath12k_mac_mlo_sta_set_link_active() takes the AP MLD address and sets
both overwrite flags when the mode is FORCE_ACTIVE_INACTIVE. The existing
caller passes NULL and uses INACTIVE_LINK_NUM, so its behavior does not
change.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..3f106ac6141c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7562,6 +7562,7 @@ static bool ath12k_mac_freqs_on_same_mac(struct ath12k_base *ab,
 static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 					      enum wmi_mlo_link_force_reason reason,
 					      enum wmi_mlo_link_force_mode mode,
+					      const u8 *ap_mld_addr,
 					      u8 *mlo_vdev_id_lst,
 					      u8 num_mlo_vdev,
 					      u8 *mlo_inactive_vdev_lst,
@@ -7574,6 +7575,14 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 	param.reason = reason;
 	param.force_mode = mode;
 
+	if (ap_mld_addr)
+		ether_addr_copy(param.force_cmd.ap_mld_mac_addr, ap_mld_addr);
+
+	if (mode == WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE) {
+		param.ctrl_flags.overwrite_force_active_bitmap = true;
+		param.ctrl_flags.overwrite_force_inactive_bitmap = true;
+	}
+
 	for (vdev_idx = 0; vdev_idx < num_mlo_vdev; vdev_idx++) {
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
@@ -7672,6 +7681,7 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
 		mode = WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM;
 		reason = WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT;
 		return ath12k_mac_mlo_sta_set_link_active(ab, reason, mode,
+							  NULL,
 							  mlo_vdev_id_lst, num_mlo_vdev,
 							  NULL, 0);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index dde7721182af..7e06dbb1e884 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -11832,6 +11832,7 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 						 sizeof(*cmd));
 	cmd->force_mode = cpu_to_le32(arg->force_mode);
 	cmd->reason = cpu_to_le32(arg->reason);
+	ether_addr_copy(cmd->ap_mld_mac_addr.addr, arg->force_cmd.ap_mld_mac_addr);
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "mode %d reason %d num_link_num_param %d num_vdev_bitmap %d inactive %d num_disallow_mode_comb %d",
 		   arg->force_mode, arg->reason, num_link_num_param,
@@ -11844,10 +11845,16 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 					 sizeof(*link_num_param) * num_link_num_param);
 	buf_ptr += TLV_HDR_SIZE;
 
+	cmd->ctrl_flags =
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_active_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP) |
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_inactive_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP);
+
 	if (num_link_num_param) {
-		cmd->ctrl_flags =
+		cmd->ctrl_flags |=
 			le32_encode_bits(arg->ctrl_flags.dync_force_link_num ? 1 : 0,
-					 CRTL_F_DYNC_FORCE_LINK_NUM);
+					 CTRL_F_DYNC_FORCE_LINK_NUM);
 
 		link_num_param = buf_ptr;
 		for (i = 0; i < num_link_num_param; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 68dd13cafe51..6d590b30ecbe 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -6385,7 +6385,9 @@ struct wmi_vdev_set_tpc_power_cmd {
 	 */
 } __packed;
 
-#define CRTL_F_DYNC_FORCE_LINK_NUM GENMASK(3, 2)
+#define CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP   BIT(0)
+#define CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP BIT(1)
+#define CTRL_F_DYNC_FORCE_LINK_NUM             GENMASK(3, 2)
 
 struct wmi_mlo_link_set_active_cmd {
 	__le32 tlv_header;
-- 
2.34.1

