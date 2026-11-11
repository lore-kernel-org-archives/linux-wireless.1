Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384386;
	b=Udz2TMAZ6cuc/LTEyj7ZuzukS1reaHoP1HXf1oMjSV4JiSaalFK7j59xMh7LBDMwM97B
	 X/z1FalP7xeTEUmgOWVJPq2ZNcIioS6TADA3L4BXH8Ul1MG/JNzIfhSDuaFwMxR1UBv88
	 mdOBicf8ZemuTeBs6EbTpmp9TeTDnbxP3E8x8Qj7010MUtojOeS8f2kl4HeQm08M35J50
	 i+UOvJoY98k3QS7oihoKt+gWzSuqdXRm6KPk+td/2JywQWlpg4e/ROn9SVKI3PTDqND7s
	 jDJ08mWVK8QqxJq7JVPCcjaJJvAzLcrURIc0TzOzxuPfCHqOufhu+FKFCiG8QpM4Q1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
	b=jySPGEHYW/7Nltm7HbgJxF325UcfbvPzK5clOaQk4/AlzrPX8wsHUAo1N4Ff6kvwd4J2
	 KiSX8dizW82Jwq9j9KK14ircRlF06OuBBpo4Br3KPfOU4Ck+8OlITRSzyi72Y6bpr46Pp
	 zBSD7ccg4lG4mzt6AZbvp10txvdVJRvNUbi8UmM/Mg9wkWkUq22a+IZpUjlGnOURwAHrL
	 81Hris9EFJkGxbU5nTdXIMnpoVpYAgt3PpxX+iWQOgMmMZzHaGRo8G7ynmvCQ9lg4Xu4x
	 f0y7U6paIZkdcNiBM5XqR1TfTG2eOs1t1IdzeIgGwvhnwIQm67UIEiTxrHfZVQwREEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AlYTsRL+;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52162606A33D
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52162606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AlYTsRL+
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so3048035a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384385; x=1794989185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=AlYTsRL+0s1BR+PujwdU1lr/Y+4yy5c+uBqYJp19RM9D8QOLaKAA8mI8AjO0BVn0cW
         ANTBzYjL2VrTEUG5aGN24Ro81LbeZ+daldaVrx+gLfCxIFaQLJmKciZIFZej3BNCdwL2
         O+4H1D9D2OcO0J6OgFblPomMjEaeqwzPvAh6AMIvi0Jm43mM7Jx9463+rXutmQCSFyad
         jVLoTzldDsDeIp4MEZNUJLoEc+SI89nBduKqNi2BiG1AIO67fQMOhG2ywQaoYeNILoao
         Esez4mHZ19cNsX9oGufEUMDg2ZoyCOnKsUsd2HbxdIHkRh7+3dLkhcg7qjJupHJtZor/
         D2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384385; x=1794989185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=xY1/9UX7raeTSmWNLg+iaZspNZEANUOYRtH2HW1GIorSzyT/zGBkRFg9I9dUoCy4nD
         aPmQOwdNjAZsytmkp+pjUUlOBP/PnQTdPwm3LfqJCYbKclWlls8hAGanPSZK+UifKhmK
         5y19LdnH2R04Rca2HFYuP1QBaUsfzRqlzJZEY12UVb0YEsSEKQQHMAWLMr8LJ2W1TbNF
         THVQtG2zLh3bS/vsIhkExRPz9NYaXVrqau66DVK/ozbJL9IIzWLuh6L1KPj3VPqtuEmD
         raCfAp4TlW/CmTfwreTA1U01SAUgwdxHDlR1GIQtePO22t3n/VAdttLw3uTIi65c2tXw
         6zWQ==
X-Forwarded-Encrypted: i=1; AL+hErE3IizcWUW+hPJw17f2wUaioGqDlhjZ+T25qd/J/hjOAadbh567D1zlZ+jBBqu/+oXzoJd6Oz9DJz8Md/GUqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z94j/Y4geXd9wUqJkPLSAz+3XviGvRah62CF3xsbLoxkuMq/MkJ
	HEfEhC/X0pCrB520Xlzwwlejwml2WmATAoXPpVjb2q+1vQuOwf43W+/t3OAo+1S+aw==
X-Gm-Gg: AYBFou11IaaGelD/4VAyVc3ypVRGOxULHn8UR4ix2wmE6bI050rHgV+v+9pI0r3IAhj
	z45X2xxzelTWlcC/0u8Lw1hUHpfKc6zojTSnHO9GI6PFnv9ES55K9x5YDCBm4JOIHaQgmCjp06x
	0Y1dzkb591vzsvq0ri+O11NvAoTTANXkAxoCQ8ha2f1vW01kTdQd9gA0SaL8IMERkVI6GfpK1SZ
	6QpkrTWp4JLYLA0G8SGtNbdptwE6BQM8M+ztYmkQtaQm+leov1jGjpx8/Bi40hrswIcxiCJ0z9H
	NOmvw8g2Kiuf9OTshLAHlCga7I1nNOCMsEhy/e3SpnpFpuiFBk+3EolUotEv+qokAiL2YouvMTw
	MGnN4s1afRom6naicP+gxwfBfub8kMwc3zcJGxO0Jd9iDwLXryT6izsO5yr1xBHzbsC9Beju/yB
	CcYo2Nm+WoLN5aGCBsmfNdiNfB4NH2Tde3Jv9EUtHjhF5Eo7Q6u3n8i1z2QOboWN+0lyM0ymD2t
	wugkCmX5ikqlKWiZubC/zRMsVDMYBOsr457cWCDtN8RrR/FXL3Z2cqN1PaAjMyX/TB2NOyqjEIL
	tKOlN0kIYtM/Y2MXCjOl1tEdB1F4ykWWhazzDDymhawTMYsIEtfTIXdz776a4bM17yNHEg0duqP
	9CZGaUxi/9mIfSHLXQPNLHk7pBNamUErcpuenxxe4vLQQw94/LTkc3LX3KI182vYOfKkk74xT9e
	BK2mROD3TPrh1rhod6tJ+xHwuN7274b8lKRApl+/XUgahjDICPk4IiIacPn98exZ0M1Ti1jOxSW
	c9RuLo3rSBC/7NfQlyi9A0tpbbglPx+Qrrhbq9itfgEaQSE/9QztbCfhXTlOPCiqDPNE5Dat3uk
	fiutR3l+Hmx4kiGPiAk=
X-Received: by 2002:a05:6402:2b92:b0:6b3:c089:5806 with SMTP id 4fb4d7f45d1cf-6b777347cb0mr1310917a12.4.1794384384746;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 1/2] wifi: ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:19 +0100
Message-ID: <20261111080620.244164-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
References: <20261111080620.244164-1-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8a..56f0673d2b6d4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1030,6 +1030,11 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
 	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
 	else
-- 
2.53.0

