Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684865;
	b=n2yIXwS/s0k4JoBkMT4T1dRMvoBWQM/x7fcnLFWBxOsb1/uCDJKt2HJ6jwGp3Mkv6jr6
	 XBxBuR6OB4mlgU5Cx9KUws2hHZmhV0T94fvy0oLNkm95ELvg8F2uhOcNRF/IWOO83AKIZ
	 oHjOk+OzxTa4WNodCBvvQ5XgwePoteaRPwHoNh8oX6yT4ZbDKyDfzmv6AfbttrhHr0HV5
	 y0PtEJx44+RdxInCjUymGezyuEux0pYi4fL+Pn23ln+GTRbwcKOhXEEwtABs7bo4vUAeb
	 aVN69tiTjjl8wLT6J8ErR/UWe2qXEVJOW7eu5VaAhVIa/URSq9omsNuD7h6t0eA29dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=;
	b=pG9K/4rzYJ0MbpooYZjlQcMZSssHjMOXpTM/Ov/SbxpAugBcBWIAc0tTQ0r3mSDYVj5k
	 4BQ/KW7FlsTracWfFVy8Ih/z0j/e6yWJeuUx9E/wVZaF1lr7BZgYYxWTJohJLL5mB7uzd
	 Xz72QhZPm/dd9ta9CklnMGelzj+l7TvINJ1ry0KsUbU9yXHGLTFOxTPnJOYOpH5G8vlH7
	 kJ/yy7TpcIA6ruzQ1QJU7eZGAaFIrfPVRm7QmCq2xgd7tfRjjZotdtHNavpOeP9RuDUsu
	 GeZZjdr0am9D3jjBZRECmGL4EbCktTclnKzp3BMftKm7cWCHt8F8w2PwHXZ0IWzqC+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QRtJRlld;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QEjNm4bS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557A606A32D
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2557A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QRtJRlld;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QEjNm4bS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4aJ2335348
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rUmomVq3pxK
	dEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=; b=QRtJRlldmAvKKEDNR4t7lUUnzBu
	wUAljhQXDI9vFpeR6bsXyhpR+LyXWRPGIjyu4TbdkMleXAmxGhuS0DjqVnRtaXN9
	sMadzbIx2aVjYsm2TgR/SUNRxZohXCAvLTAwv8XhG4GKHcoa4AFYK6sRBAx0aEXC
	Ruo/uI/bg8z24bFR+0Ar/tCU3DZ9Potbxj1gxfb/GFt/2HaOQvbVC1HzMB00ar1S
	VBE16KcXGnEOMjGocGhCIlCdLan27+LsHYfV3XmZ6OequaaXGMqS8MgiFf8YVWRX
	mSMdNjDHPfM6txH8PqOPrG0DjpxGZ0pzqEK9NyvmawKOIk4knUjBjpiuv0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01jyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso5185984b3a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684863; x=1796289663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=;
        b=QEjNm4bS/9S0A81Q5sjKNTHZkyWKmpFW00er6+Cy42W1Itx6QtVvzoz3Jh3eUH+J89
         5j1hcZ06AzNg9JiGFSEA+8/BD4G+f4npgHR+vsA/eTNSWyo0F7AJdq62/+01+5kKVqQn
         p6PhwbmP2n0ovafCUykaYY8U/3D903bGGlQ3vvUw5caZQUadRo5E1KhZMzT85WciaP4W
         qnXCkz0Zlyw8qX3s6Ix4YXELDafDV2ISmjCMw7XOH0GrPjR2CF6a6oXSgiDXIuxry4ER
         BAoRwTPbQEUIt/R0JZC/r4wdlc2rkg/sVkwXnh+9aPLYjw32tuV+xWe0ltg8JT50AYos
         ifNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684863; x=1796289663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=;
        b=diyChvFAfoJGhJj/OHE4/0nm/u5/z4MKnq2BbzSupKfZhRJmwrfedXwbjqgNPEgF74
         biYoghpU3h1AS8yoKg33zFrYBmWkltYrvxokpUwQXEVScDyz5wutf0hDzQPeijS5geX6
         GwZTuonmecysrzbG7yth5eGpK6EjWICW9YiZpxcym9QsK0uX7LNnVepuf9nBwoPXKJph
         5YRX51o7w4FK1LdarZZkQpNaLTyAFEEDOEgXoPv1XwMtDsTYopTY6TW7r9rKUUVEVmkD
         +KT8PN6qOzuleLShq28XKHVHo7pkTvuf+524ZM2Fr0gFWKB4xm/qQD4mwXnOHwrP2Q/s
         EiBw==
X-Forwarded-Encrypted: i=1; AL+hErFlCrtZ2FNkGcnB31AX9ma+Ksk9udEkGLkOazyVyBuFAZwdBXn9llcqNAhOz5tEAS05HzSKjVEcNkOylBTQsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wazoADAptXRKkbAoCazpf9qOhGaVSGJtbJ6iD9FVJ/UwAfoSh
	5tNXsDpjA03+DKd6m2d/kt1PecNf0c5nDAUZi77Qm83PIH3qO56a/+vDvRvrDy/b1e9/VZWHtN4
	sUzIawRRgaO1pe8hXOGF5oIBHoosI0/rI04xdWn60ca8WxF84bMGb+cAkIbKTH5sfyBHUaQ==
X-Gm-Gg: AZFdTZc/XJ/kPAzjvs9Dn6YOHFwoPml2kJe2xJA9fItV5nqBZV1WMzHNGGzl9xiCbYs
	ARR5XKcpmzbhS3TqZci7XEidh6vKZapZFb1P3WBqZi57cYdwkChKENhcwHaD992avDxCe5hTboN
	Ymvpef4UofTOd2wJwnlgZeUffzIkdFEavaH6kO92DoVT7nY5xPJJ8J9x3RI8Bcoi3aKF4+BxRpl
	49zqamPKaDWsAh8+bVMbxPhV5fRpaGC8K6gBjTFfqphTioA9XCdK3DT/DfTxi0tEEAv/uGhw8E8
	hMgUstMNEo77yaAAb4f608MxTpJmKXEV+IxJJ6PnrLgxQ5viWCvvr3WFxQfmO6S1QjBBzb0mLPL
	fME3q2O5TRBI+t0VE1Rq6wH3dch6wEpBFD/ZSFSsu67p203R3DhIBN8DOi/fJA7RSer9mNr/2qX
	S1sfDQRs82OH6tow7oT5Vmd6eS9tj0DbM=
X-Received: by 2002:a05:6a00:1817:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8c87b9cfaaamr18250005b3a.12.1795684862773;
        Thu, 26 Nov 2026 01:21:02 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8c87b9cfaaamr18249983b3a.12.1795684862228;
        Thu, 26 Nov 2026 01:21:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:01 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 5/7] wifi: ath12k: restart STA link vdev on chanctx assign if channel changed
Date: Thu, 26 Nov 2026 17:20:35 +0800
Message-Id: <20261126092037.462830-6-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07f9ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XL2xf8-uihB83E6xwaYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Z8N2bDtvxBNB_owTmMLz8FNk3gPzVTrd
X-Proofpoint-GUID: Z8N2bDtvxBNB_owTmMLz8FNk3gPzVTrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX6YWdLrULUFrJ
 HNfBb1e/j7cbVAPUqlVQgb0j4ozkbs95tWrpKyOwSo4Vs6MpuFaLTrht+X/p2Mu2CCPR3yqoO1B
 3cfNLwPziHBNGXu/nRX3TjMI8NO/sFmcxPtD4Oeo/x25cJphdX2BJm92aEy8s1nfYqDhSQsqgYx
 OD/avBaLeyVLjLygoHCtiTVN/+8SQKnKshWDWUJUnqoPHKV31tcILiGbDOsO03FurQdIX6l5vmc
 kepOMteb88+u1ugwwkcTblwEQFJxDuu57R+0Rrnw7zQWCoaq87P9GSZQ2Uf+x52r5yABy+2OPf8
 risskKxF21gTgmcV0p7+mn/jGEfOBDKs+Ww+byNF3CVRH0RY/IBtRvCGAjc7XXvUT4krAVq4hXe
 HxlYoCfZXpROkC7LwFoYPSXHCC5+JKEWszu3OH+hZlrvmQvLx4le5SN01S4FvxMQ29mFd9dvPoa
 EArcVVWM+3sOC8T3xuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX9MwI89iJTTy5
 mfiPHxN3c5U2O4fKoA0FsiNRtEBkNpgqBxBXjlGR3bUytlSzDQKkbccXUWIAcj/h675zSRa/z86
 frR2RZGtgYXDSRFH34VvCG6o6Cob0AY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

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
index 2b4dfef3efb7..e79a9e55c248 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7178,6 +7178,13 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
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
@@ -11549,6 +11556,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	}
 
 	ar->num_started_vdevs++;
+	arvif->started_chandef = *chandef;
 	ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
@@ -12443,9 +12451,32 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
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
@@ -12510,7 +12541,7 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
-	WARN_ON(!arvif->is_started);
+	WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA && !arvif->is_started);
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath12k_mac_monitor_stop(ar);
@@ -12527,8 +12558,14 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
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

