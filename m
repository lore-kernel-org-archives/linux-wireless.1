Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384388;
	b=YzFxL2WtGESh5UMyfLE34EnmqJzOXTJ2+JnMXE8a7prl1svhO0xFbGSloGnDK5Eshus0
	 yK3rhE1pja0nrice+DCtlo558ju4bsoU5EXHLfiY5r/b7zA3O/rhuQFx8aEwYCPpPZRD9
	 akqOzligPI1RPiNsdMXUC3L2X8e2aJ8zCbwCxNKgfYf31v0E4LVp2c7iipkrjS4k9nGhf
	 gtOW1TtY9v+PDF+Ywq6K3ffcAKqCkrB2TC2Q7m+orBwngnM+GUSXnQKKUyPOZYzIOF2e3
	 KC4sDfuBviMmA7QPSXsxjoMBsdIDd9SwIlNiBLj2D0t10LX3s3y/xBXHYFY0WosrPlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
	b=XVsK9QJ9vWis6fILaxakdQs9ir72thpLmrOVXz+tcYk8jTrkMjbcuifkaQLqjAH1ajyB
	 DH5MQiQsk4O4tijEjJy62VU1vqwUc3nkO339C+B9s2snMFRKALWzh8hVDGSBlIhVtUrgf
	 9ws6JH86a+VM6DzwyGvmqkeBSb0Ft0QBs03xdJZyGGXjN1jUtczuwvRcIRiFZYmIIOqXG
	 JBqTod+QAc7IFyAQlpTaqf5OjEPRh7IKfSNYzvxQ2OWLM9+VC2ERANnE5+9Lh0/MB/+Bp
	 xpBXtvNm6w38Y7imY0aJscUnI8j8gkltO22SAbjkRvKZaQQEzg9ZZDUqDBKGsYs5Ouw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V4SILspf;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116160A261E
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D116160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V4SILspf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso487063466b.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384386; x=1794989186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=V4SILspfdf6H/2PHMFsUdohlza4tuw8dzxxXed0CK9iVj/t9JN+k97b7bdMXHKxmfd
         YkxMBzxYq8b92tRN7kHd/f395OF0ElsBouzy8Ut63RE2POsiohfj0a+WkqJqs+o9/9RE
         ynsxTiOGqRPl74wJQyVTHfFDIxPwSwnw34hycLBHc7QEeiYwgHY3sm1j4GsaizrdelCB
         vComm+PMRyu0a+ybTePZf5amBz4yDCwrI7cwdFemygnes3fNcmAQmivVH1AozowARawc
         Pm0kP1kGsYqjSp9i4uJHaKkRk3g9S0JsgzkhVc3RBFPKSDirBSyUru1DLvocJeFS2WcJ
         nJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384386; x=1794989186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=airObbwj1tOJL5UE2Z70sJuQwVA54bpQoslSnDkqfrYAXwQOnZ34CQQvp/4twBhijS
         NamST6EoxgXm71ip35PhZftA5OLIv0tsacQq6da51sDKFlfTDEVhI13dIwfVhlFOta7V
         P4ZG1fGpuIUH30RrwpnJXuH3VIYHbYPAcN/5IdrB2CPQ5i9IsYTHrzKT/QbOh/CO9tCz
         4Y4faMmlOoMiYkdqe64YCgC1z1p3r1/mtTVfj6MzDX1lugCnoJqhwzbDj4wnH+0B/W2i
         FZEtBXS64+mmcpQqgmXjmMk1MGj+S0E7WiXZuc+9PNuzkckA4mTBtCQH7+o8Z+H2Z5cY
         CZbQ==
X-Forwarded-Encrypted: i=1; AL+hErFm4uRKNqwydtEUnsumWft8Wgkr6HbAuo/0Pf1WK0GEnbVYgO7idWVZyJ0tNTptWXhZPpxElrusnxA++sd6yQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vVoTWaJk1NewAxua+FUdmZuXKSYLxMuCjvExDmEtagimkCEKH
	pU58JuDBm3N/QxvMIXAUNJYTYSNkfQiE9udFvb25g6qmLvUo93SDbmvqeWD+hGfLbC4jz+KhADH
	joLgrHoG1
X-Gm-Gg: AYBFou0QcYqS56VfB0UGwZhoHkEu02CJyhEyrOGIeUNFNeyDU77KarYezNl8qU2g1he
	sm+y2W+UCubrP4ndxi8eeY1OIziS6+VCrz1jNOSxJ/XgqnybvRxOu8L6hA4fZZ9EpS9PB3/GJxM
	faP58r7SX3R1OQhA0lNVofiVICAvzI0gjVSNs6ku0t5ij3u0gbEt5UrnmedlPeqkLTnpDHcNwn7
	erZvTcyA40cZi4/1QHySIowMJBfLvtInxxde86OtkpEoKENaGz79s+2TIVLPigQmlvYKgfsltoU
	kwufqYY+2cHVyjWqiffXIPstQpuhcPn03Ga8ECIbCNsg8BLxgf46wDCDIsXGp+uhTmfm7zOuGkB
	z1QNDXmnpuOQlpLldUU9OapObHE8gDQuAfGnt6k3+8t6zoe5SLBOGZu5f33u6o9/kphs2TOpCtP
	toZi6FHaUHVfA+vmObFstJNMh7iiKAdg5ceMiHXwtzOVrNqbjr8VMjcr1YNZxAKbklXOtkN+v56
	1qFCeYAo92Q0/QhMD1LoDDiKKfRCnFJTTgYlFCjd/9lIwjs1Ub1/RPk/ArmEoGNfvGHUUVBoPVo
	eJUDLrqARznvC5OwSh06DTFheIeD70qtzFi+UyU6ULP6vRtQZTDOJziBhSKAPS+zsK2yPiP7p8O
	3xb0VvDz2Rhdnvug3R2QAmo+mCYMivAE+fkNrhElVPtawsYWyyh1IxTBxPmY037vGXQEVYVOWOJ
	bsHxiEikMQz/wufPkmm8IGA46epf79beohrSv1B7g3xpyKvRg+jWgqY9JZuLOt7VIOBQMSNsw4J
	6FcAhm/RGoT1DManNh80dKA1Zvj/GV45Q659lsCSIQqE0mtf0IjwhaSqWvk0XI7nNOo8Cjbo2fV
	zpUeuyi7xjtR88tfPqY=
X-Received: by 2002:a17:907:3e0f:b0:c50:5275:fb97 with SMTP id a640c23a62f3a-c5066d70b41mr112406166b.47.1794384386217;
        Wed, 11 Nov 2026 00:06:26 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:25 -0800 (PST)
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
Subject: [PATCH ath-next 2/2] wifi: ath11k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:20 +0100
Message-ID: <20261111080620.244164-3-julius@bairaktaris.de>
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

ath11k_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..f77a45b7bf84a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3270,6 +3270,11 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
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

