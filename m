Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970573;
	b=MMhNcB7zAIF/D/FqLPfmKPh+tn0OVGfvYlP+B8k5gMbm+59YdvLVEGHmEQAp33m9Fspj
	 mq9BCuDpSLiTnegfJqKOx0AimkzKqPIE1pCN4gWkOz5hLVkHztoju4jEWtrrpo+4hbgdT
	 wJTH0vQFEMlXq3e6tYHdI83Le0nZxxagPtrBTNDYj/dJVZpYSsT0BM70gtwCn4zULO+At
	 ROF6p34Kr4xQkSdD2WosgC7PYQycdxtp0k/R4lrC9ejx22VCWdk1UGFPb4da7EwyxJOTa
	 mt5Qb+EfJlW4lRMWFSBU4ek4MEXom2U9GOQ/Dx92WONBzfRcG6QwVuji/XO8TB8RIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=;
	b=RpdmmtvrUVWT/kzJM3W9/GXJsiHl67cdgKZaxteT6t7YHYrwEhLa4hRzQz/A81o97tln
	 5+ClUf68R0lQAC0TLUqarUz0OJMZ2hsNFP23M/ng1lFWf4F21N/8Cg/2Ryl8TT/KS01AU
	 EIL2f4gWyZdMm7SoFpAoO0F6Ock8OMTfDcewdqr9Bj92bU9KKnDIPLtCLtmmMp9N7xGqH
	 ifNlWHN0SaiYepVnywguWtMi0WyxQrxU2IBmXm+33NgoH85QnxNMlzyJaT35fYTHcSaiU
	 e8Zgwqa2MPnVxGLO1dVzvkdWWOZLpPzIBs8jTRTgDlycAVALQMtzmhQnme5mYTmE2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOmgD5Sj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CZGNtnpf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1A606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E1A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOmgD5Sj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CZGNtnpf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uvjj472539
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nbDRUTCjPqh
	Agek+pBusAFytes8H5KmD5kCm/TKSo5E=; b=bOmgD5SjgRqTDRntytt1/YxUHFR
	0m8KNT+6DyqTn+lXmxruTvj2h3WgtwyYCTJGYiGAqP+xExKKNKO/+rpY4skNt6Sw
	cTvHZA8qvby9PDxwF5n5qH70Ertwn2CUZZcxk/T+QsZK8tHew6ZaBOK3s5Wdzcv5
	sdUX86mFBcLr1LS0p55p8m8VZ1uIVYKp+lPAKhcKJ++rFSPt8vw6ZaiFEdrsYPfl
	sRv1RwJgCRNYee+RkgaD9poWE0sLcXMAxWtdAMeXrk61sXKr35u5RhXJFY4hYuQX
	LjDxyexLtyC1MheT18vDKOe4hafjnbIjvW6u0qzDvKIO13E5UaNf7IgHndA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88u02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so4874435ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970571; x=1795575371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=;
        b=CZGNtnpfIAZTokgoMNHuVnSxkNVpZtMdMuUkCr1a1G1e7Ui5nx5kO5cQHoHRJMVDp3
         C9x157Aj+Z9tYOoddO5zWeKB+ygH15XcpYsLdtpiXtSjayeJr4S4ciWgcCSpzfinfU8l
         BI01xO5ActXob6Ytyav0n0jDNvLjTW9PZG6e20Y9MDHhsRfSrS4aRxHFeivrRpOu0Olr
         ibO6w4v8kHGwxhqdwysNN9nPcdfCsn6mcHrohBn2bs51rMl8Dz1ldo9Xf+Eb5v8O3sLS
         OAsXmEEGR8UjUATgE+uyQX2naGMlx3dRkS3D0iZCmA3Oc841a/QkTuiwmwvvy0u80g48
         nnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970571; x=1795575371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=;
        b=XwgbTQ2lQ7ewQ3yZOWUhlxxaKb0qgp2uKOv0NsWnrTR2WonotEd9TcNlGBW18xP9wR
         dKJ8ZzygZOBJpxYZqob3l3wpYBlRC57vUSIHtHIFuUwMovPC34AQBFo2FIy49BDbItJW
         hy8UHIsFUseoC/2p6pCCf/1y9WnzKbGr8ePo9l3+N2cCtH3I60ekRLEx53kLPwvYGDky
         q4w7cZ6RpVvVi+2r4D2U3sgYnnQ4PiTX34VdJoB/l8jQiFyISR9mIb5eolVQpgpyvRKZ
         5vl4wTxO7EKIHLN3SfzDUV/Fm13xkBMb7AYN98HNTFAjey94aYauJ/IWeE+RQYh8lQo+
         BBOw==
X-Forwarded-Encrypted: i=1; AL+hErFu1bOFxW4dme4HSadGbKyUaVtwlKv49aI+YjZI9LQjiuK9azYXuQYM30mUJCoI4bUPCILhe4DwuGBDF/UJYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EesxhmqxnBMKn5DvbiXLrd+2us2YAGopWXuKboG4oTJK0vFdc
	0ElT1dic0d3XmF4TQnKuRgDJTkNRMmOSNdqz98Nkz0bdHUZitAGOFUp81JCoDrRQR1vVE4DI2gU
	j9i/1N5JjDf0vXOWJdYef3Dk1zkA82IjaObg8cO0RD9nqQDDDCVMaZzU61Osbk00mvKxsOg==
X-Gm-Gg: AZFdTZc78guNaAWF3+jJh49cIyLEmspCfVgWn+r70A0WTl4XhjBhhdKrdQwyWuEyIuG
	fHHAqP+s3BePi0doU45SKo2kKzG8w/AfDlNRIdknTzHpDYynUSSUwDJwVvSEyXcuiT0M2ShDmEJ
	medW38cFn+0q/rsPC5q9MLx/mXjRdBi+qB0n4gno0xTAyStg7lcEEc1mpA8h52pqWrwawLIHo8+
	GcqRqvute6VsKLZXCw/yw91iOIlK/QnZ1UXF36IB8OqpMlPblb6sMW+OzyBp3db7bGejsFvMQeN
	y8R+aqHSHUb3Ls24cT3fVOU1K3t46eedjuxd43TQSZTiqOWPISCYnotHp6W+f8KjV6TDoIYXML0
	AsNMMOLn9oImexdoTChQWm0DlkZqbHGXsYRC0KxX+OMUv99aI17dmA+TzxXI0kb1VO8IujO4lF8
	owJYv9hnoNFab3KTb6xCRwDuGA+mXCVtk=
X-Received: by 2002:a17:903:1ac7:b0:2ef:eaa8:9b55 with SMTP id d9443c01a7336-2eff753acfbmr9743705ad.53.1794970570595;
        Tue, 17 Nov 2026 18:56:10 -0800 (PST)
X-Received: by 2002:a17:903:1ac7:b0:2ef:eaa8:9b55 with SMTP id d9443c01a7336-2eff753acfbmr9743535ad.53.1794970570002;
        Tue, 17 Nov 2026 18:56:10 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:09 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 5/7] wifi: ath12k: restart STA link vdev on chanctx assign if channel changed
Date: Wed, 18 Nov 2026 10:55:18 +0800
Message-Id: <20261118025520.39269-6-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: OeDdpaGLkCoze8BKVhyv6pubqipLNyNp
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd13cb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=XL2xf8-uihB83E6xwaYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXy0yu45XUrdCC
 CmNNYa90ENbK3NybSXwGbtrIyhED0iEeG1o43Nl6a9R0Va+/m/a1oJ/xVsjku+7v4I9bmjbukw4
 0ChzpDWxJNk8eqlrujUXAS5z6nn4Swp7b4bAmRebaT2gJCgPSd+wyv4PRQ7lpySjyvm9LPC7s20
 +GVSxnFeGZRkPxeglan6qtf9Rt8HqHJkwxW8fAVcOmssV61S/cxVs5Mxzhs0AP4E7WJDKEP/Y3v
 e0sO6NKATyJ2iMe8sUeP0qUTEBchZOoVhLu58HjVdy3pZqthLYk8mFArX8d5Pj/DCCHAMTJOxUT
 cKO0n6OsmN+ELODNXyJCTGe9KfPAnv6MSdErJRwMF8PQT4Rw1Sh/Jt3Zpo62RtZ05M/Jh17PDSz
 PgRM0yT1Fu720x8IeG2qAHmh6H8ZiCjnR3LtQ1AzUoS+4ADNScSxTwLRTdo5agPPoMtpqNb1k1L
 eAuNGwwCskoArmTAdkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX5ACKVeoVv66e
 n/GvO6/4+NdS0OkJ7f4o6PSnuSQeB1p9ytkg5DKqk6opzKlpu141gSGSisegHgGy1naH2xlzO22
 ma2UKW7XXU8I85oslNeU5f7DYT6K6Zw=
X-Proofpoint-GUID: OeDdpaGLkCoze8BKVhyv6pubqipLNyNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

When mac80211 changes the active links on an MLO STA interface it calls
assign_vif_chanctx() and unassign_vif_chanctx() on the affected links.
A deactivated link has its channel context released, and a link that is
activated again gets one assigned.

Currently unassign_vif_chanctx() does not stop the vdev of a STA link,
but it still clears is_started. The vdev and the BSS peer therefore stay
in firmware while the driver believes the vdev is not started. When the
link gets a chanctx again, assign_vif_chanctx() starts a vdev that is
already running in firmware and counts it twice in num_started_vdevs.

Fix this by not clearing is_started for a STA vdev in
unassign_vif_chanctx(), so the driver state matches the firmware state
and the vdev and the BSS peer stay in firmware across an active links
change. Only non-STA vdevs, which are stopped there, clear is_started.
A STA vdev may already have been stopped, with is_started cleared, by
station removal, so the is_started check at entry is limited to non-STA
vdev types.

As a result, assign_vif_chanctx() can see a STA vdev that is still
started. Compare the new channel with the one the vdev was started on,
recorded in started_chandef:

 - Same channel: nothing to do, the vdev is already running on it.
 - Channel changed: restart the vdev on the new chanctx (vdev restart if
   it is up, otherwise stop and start), the same way
   switch_vif_chanctx() does.

A started vdev of any other type still hits WARN_ON() and returns
-EBUSY as before.

Since unassign_vif_chanctx() no longer clears is_started for a STA vdev,
clear it in ath12k_mac_station_remove(), where the STA vdev is actually
stopped, but only if the stop succeeded. Otherwise is_started stays set
after a disconnect although the vdev is stopped in firmware, and on
targets using vdev_start_delay (WCN7850, QCC2072)
ath12k_mac_station_add() skips ath12k_start_vdev_delay() on reconnect,
so the vdev is never started.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  5 +++
 drivers/net/wireless/ath/ath12k/mac.c  | 47 +++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..7c7057468916 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -331,6 +331,11 @@ struct ath12k_link_vif {
 	bool is_created;
 	bool is_started;
 	bool is_up;
+	/*
+	 * Channel the vdev was last started on. Used to tell whether a
+	 * still started vdev needs a restart when it gets a chanctx again.
+	 */
+	struct cfg80211_chan_def started_chandef;
 	u8 bssid[ETH_ALEN];
 	struct cfg80211_bitrate_mask bitrate_mask;
 	struct delayed_work connection_loss_work;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 08d9af0a1127..f57d4ef413e8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7167,6 +7167,13 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
 		if (ret)
 			ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
 				    arvif->vdev_id, ret);
+		else
+			/*
+			 * vdev is stopped in firmware now; clear the flag so
+			 * ath12k_mac_station_add() starts it again on reconnect
+			 * (vdev_start_delay targets).
+			 */
+			arvif->is_started = false;
 	}
 
 	if (sta->mlo)
@@ -11536,6 +11543,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	}
 
 	ar->num_started_vdevs++;
+	arvif->started_chandef = *chandef;
 	ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
@@ -12430,9 +12438,32 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	if (WARN_ON(arvif->is_started)) {
-		ret = -EBUSY;
-		goto out;
+	if (arvif->is_started) {
+		if (WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		if (cfg80211_chandef_identical(&arvif->started_chandef, &ctx->def)) {
+			ath12k_dbg(ab, ATH12K_DBG_MAC,
+				   "vdev %d still started on same channel, skip restart\n",
+				   arvif->vdev_id);
+			return 0;
+		}
+
+		if (arvif->is_up) {
+			ret = ath12k_mac_vdev_restart(arvif, ctx);
+		} else {
+			ret = ath12k_mac_vdev_stop(arvif);
+			if (!ret)
+				ret = ath12k_mac_vdev_start(arvif, ctx);
+		}
+
+		if (ret)
+			ath12k_warn(ab, "failed to restart vdev %i addr %pM on freq %d: %d\n",
+				    arvif->vdev_id, vif->addr,
+				    ctx->def.chan->center_freq, ret);
+		return ret;
 	}
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
@@ -12497,7 +12528,7 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
-	WARN_ON(!arvif->is_started);
+	WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA && !arvif->is_started);
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath12k_mac_monitor_stop(ar);
@@ -12514,8 +12545,14 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		if (ret)
 			ath12k_warn(ab, "failed to stop vdev %i: %d\n",
 				    arvif->vdev_id, ret);
+		arvif->is_started = false;
 	}
-	arvif->is_started = false;
+
+	/*
+	 * is_started is intentionally not cleared for a STA vdev: it is not
+	 * stopped here, so the flag has to keep matching the firmware state.
+	 * assign_vif_chanctx() restarts it if the channel changed.
+	 */
 
 	if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ab->wmi_ab.svc_map) &&
 	    ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-- 
2.34.1

