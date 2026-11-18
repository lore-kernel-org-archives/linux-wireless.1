Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970570;
	b=zLSr6nj3AYA7+DuJEb0cTyoWNZqdjVSn/e/w8s83jDY/RmkiMWvWO5Tb/E71w743kz1Y
	 UFCu73GFmjbPvN/oamxTzqMgW4bz5IoAUymqUev0MNOYstYppNUDsmBhG8BFR3opzVPbZ
	 4QhwAr3N6IVO9c56o/kbFMY2Z317fAg2kpksx34w2zllXJfeymEYHJxbnKxqV7HFzmwcs
	 sCS4mfbnhG9BQh/CYTkMYToCvXKzPEfcC3pZFRYP/E2GXicth8N5rThT/zxNCV5wzEAgn
	 /QMncaiwGwJEPx6JGiHRc5UORZEpO/eL1EV2+U5N9tIrYVX8J6TC8LTxo2OspBhfbWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
	b=ui8tK8Dn0a+ga9f1gv8DOstxqLCgoHpjj2h0DFHpqQjUQri37jTuEPfBs9wHXol5/ZME
	 THHRtF3ikuxKKzrFBBUqGiqeuDB/xI+dDZocD+CYL50s5a7Z5vX92aTcudy63jO3lvJRn
	 yhrle+xaFmKMY5GgDdFy5l9YA5MEbfoMPIigzZkFtXyoCqiBEx2Bawyf1krFGFYkxW1Aq
	 cK5Pl7L6Xy08huf8QYeAI0wK0Pz/297p8djKmTDEuxvaLh6RtXugk/e4nuzjTH9MVzs9P
	 Y7CB1IerG/ckFwTDPRon11NthhIcMpOOps8zjUksIAFDVwOy1Ips6u6ZHqFtZTHKK3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEW0v9VG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkNjgHWA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45730606A881
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45730606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEW0v9VG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkNjgHWA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vvhx4059960
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/BdE95b0vsH
	0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=; b=hEW0v9VGQpu+MBWyXf8NJMRTZBc
	A25iPaJyTQgMxLkkiyyRcjq59JDVD5rYaBR/1GA4joAhvLfBh9enbXdDkr8rei4M
	YiVuZeRKrhVD0E4rQzgDnrBnm4dwYfODzOB3aHZsWagJf+BwZd6gMnsO5OcXCTDs
	Zdog3QdRmyCe+gS48t/jz0TuJ6PRDppNrXg6dG75hocqSCDKJ16pI3MSqv2ESp97
	cxvjPGRJrJJKbvgM0rxhwWa2nS/TjZ4rgy5igbYbksWwRGK5XrNxPnd+kYEjQ+QI
	DBsHsfmSF6752nysufCIfe40WhhU4Zrto9KmBQekLO+TtzvC+B8jVT5xiTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcgve2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eced5a4cb9so4404875ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970568; x=1795575368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=PkNjgHWAbGj3ETAPEgeqS7+FwN4MRDvK/2Zah+nPSx73Cv5dM50Y0nbulIF+Aqd76/
         C5pocl/KqqoUoDenzwVoVnhB7dCp7xRrA+c9hb47fCNYJpJAI0T/uzCH5BeUe2nVmhnI
         5Mw8ascDUkz9C6s7vQi4QJHshzm01GT7wzPTKmG3GXWkncoR9gAf12ZG63wmHPId2Ej1
         qENIL5g8y+A3mDisGHka81+k/LkHEbdVqAMa/px48D9vDHSoBW5byZ2UU4haO+2TEkM4
         YtJY54CxPNFLMIyEDyZDrvsFiun2V+qThlnz4vxz7PDJo4xc0gP7Iyygr5EjAz+eTjgT
         vydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970568; x=1795575368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=WPq7Yie1OZLkkxykczkD4P5ERf8Axg2sQggAhrNp1EZcL61FLGMOv1wSRuIpKSNC3B
         1QMNgl/MPe2DIkl26HzAU0RxN17yAZ4gfGns+WxXCecMbvTpaZfUsLTIWs7GTyzozKOF
         Md4yz0XisbHxsPYss4kuP9qBInvFKqvUzk6Zjk9AP7eBV224P6BWK6uM9WPVtdUFJX/C
         4FFuvDtNW1mBPVj8XgKHgJGDF3uY4BqADDh0iggPd9zbKFH4H5DAPjJbSuXoyjslCZT8
         p7lnpCRuU3gAkBw1aFbcXplA2fL8GYKtxGEfYY/njz5VoZShpNRIhqCpFGDPbIgaEODX
         QETw==
X-Forwarded-Encrypted: i=1; AL+hErFZFuCALVz61mLlznrGesNm/bnEogCgYI/pZ/C/1en5ki5Xz3O8ehJYVDD3I2eEml/zac8eV4Sob6kpDPcX3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9c1FSW0gAJmmXhCHQ1mfx/+hqREKweShQW9pHeH6MsnH21gP4Q
	GWrKnBC7KY2pciWgGxKVCg3PtFLgM6NwZxpeP5IwVjT1gDOsIxhPzjmaolkwK304xqKKmGThbRm
	p/34vEMGG5vpWCEJ+WvYfa/emHimLHgMP/rKEPhcRKrtYkLvtfNoD+1py0JNzT2MXGDZv6A==
X-Gm-Gg: AZFdTZfhokHwftDc4mobNr1OdgxbI1MP8dyK0d7r7XDTra3h+nRGncXxJvhhc8tWpSF
	wNy1TLEySrx7DDYyLhHHuzt0lqWF8u1rJkMV517YZx6r6HrWqbB0KsNTyN6B9ORcp+Gthecz03C
	hPKU3ADwE857lfQIqxcjSENPJjbfAMeBoO2rH2xYYVs8pwAY6Qkj04R03HjxZ0dywPm8dCs0U0y
	zzKo72OcWuULhNyw1n1R3fRY3a56S9+PVITgPSltPQARR/WZk4y6apyHXdl+zEiuoXoZx3cjOru
	fbQ0dMtWzqnUfhHUt1j1oxputaNxIqDWPanWvLS6e1Xwl5VIRC6AJ2rATJjv0o7YTTTxJi5FsbT
	0fx5JXykwP990GR0rs0qYvdXHBXP+YbNcd0FMCkTlGFuskjowDtRC/mhzPK1qmfQ9Z+pJaNXo9C
	Ry5HELJHC5PRNuZ92SfCy3cQoruzKf91Y=
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288565ad.16.1794970568000;
        Tue, 17 Nov 2026 18:56:08 -0800 (PST)
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288395ad.16.1794970567552;
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Wed, 18 Nov 2026 10:55:17 +0800
Message-Id: <20261118025520.39269-5-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd13c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uWdthU1Hj8U9gYtQ1g8_spjd-g-JVwAM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX46duATGDJQaJ
 EOEoAFFifFEcxHgdau0aoTsB13N8q+7D1YTIgFQwYWvWYOnLpI3YfImHlob9JbSFgjqmM2WvRBz
 V/N66/VJWr9iwTfs+arf0yk8cZnr2/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXyAngorjxHcq7
 ufOrrRdSVyFWcPRzeO4DhftqI3n1c1hsnFHJStuDU4RPkbJfpghZS73YBt0CIgOdjEPwZtu++0e
 3TteU1crxGrVuSEL/x35Nj/BdXsBysDCJt6vcxpXAGeZ+B+/9QEXugjnXzgi2jj6/JfykuXjRbC
 ZULUDhd8k+nikX2DJaRrozxGUzjcQI3B+IT2udqyCrW37CqJZL2KT4EI5ZdzntaJG0Zsbd70PpP
 40RnB0gqh2v0bHxjflqfbwomhjvp/W0vBgVSA1HfToMr3EMt8PFqLBRENpmBItOxybu2CMoCCS6
 AwOYGj0P10nmNoP9aL1yq0iIBpP5TwLYaXadJVL9HNsOkrxj8jO7CEyVy1oZ9FcAyl9fZNTFmRy
 flVCQVhUhjG7W6u5QWufVx7zpJvHJKUsA5MX1P86t7jzIMljRmvZEDjounBF5u4BXEelOciSzPH
 vf9MDoVRZra/W6RNHhg==
X-Proofpoint-ORIG-GUID: uWdthU1Hj8U9gYtQ1g8_spjd-g-JVwAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

Active-link deactivation releases the channel context of a link while its
vdev stays up in firmware. ath12k_mac_get_vif_up() returns the first vdev
that is up, and that vdev is used to derive the target pdev. It could pick
such a deactivated link, and ath12k_mac_get_target_pdev_id_from_vif() would
then find no channel for it.

Skip links without a channel context in ath12k_mac_get_vif_up(). The
WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif() is kept, since
callers reaching it are expected to have a channel context.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 28cb549b1f46..08d9af0a1127 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -953,12 +953,23 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 static struct ath12k_link_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
+	struct cfg80211_chan_def def;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->is_up)
-			return arvif;
+		if (!arvif->is_up)
+			continue;
+
+		/*
+		 * A deactivated MLO link keeps its vdev up in firmware but has
+		 * released its channel context, so it cannot be used to pick
+		 * the target pdev.
+		 */
+		if (ath12k_mac_vif_link_chan(arvif->ahvif->vif, arvif->link_id, &def))
+			continue;
+
+		return arvif;
 	}
 
 	return NULL;
-- 
2.34.1

