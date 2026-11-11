Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430121;
	b=kbkE4ukaojPwxomD37k9g6+y28tQzY5gdDUSiswlunMe8IaAbW4eZZmo63Tnw+mX/H55
	 9d3WFXjGmeB7b5hD33E70AyUGi+fYHiRDNAJwU3Xd5kMy/CUTq7BZAesq0GjwTMNEEp4f
	 L5LMOty/eycgJOKHK2Iw6nRVIxW7ucF+DrHJPnnRK1kr7fTOGhOZqJwUjgyVN851e8Ayf
	 cyxNbo79SYCA2TzofhjNbNy2Zd6Aoh9+TeNdWBE7qnPdqaePP77sAhjM9QAtxaF2Cq8+6
	 /RX22X1uxg1mNt9wBVZA4GVhKibDOmKlFqo+QelY1q58vu2ozaEjasDeMY2NNcVfHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
	b=I5R3iUvZQ4kGneprHr0qqejIDPkrQZplCUsJ40v81F00YdD38YHL/a/M8VLWgsbGgY6j
	 WqHXjGbDqaLZM8YPdtgQmGlaiaAqSZqoDteCaidElan4jVYcXnh/5WvareC4vcYazGu5C
	 EmWFYaR1j/trsc8qo/qprubCqdyS3a1sarUhSdy/MjzNSQpn55XTClMkyyq2VQTsUDYWl
	 C01t6K39Zc2oDgRORXMDg8KAY0LZXxW0sh5gv5CPp4gQBeWdgKt4zHJY8qhkgYh1yCs+y
	 ztM/NPiQPeL/yaUjvJXi5S6IlspItOQINY9SRZ2P8jRPZ2mec17C0pWg3gn+es+/Cmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4qCL1v5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0953606A324
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 20:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0953606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4qCL1v5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso25034125e9.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430119; x=1795034919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=Q4qCL1v5fIxj8bw8rdATJLBkqyGm6m7VRxVkizxdlSY9MY0bd/7Q0K1UVgFon9Yge/
         VYa1M07KpHocoYsKP4bnYWowK+sSD9cCM5EteK/QA+nUs0+Ts4HvJkHg5EaE/7Wadi11
         UrO5IBN5oeRnp1zJLUm0k52lSTuDwUNW0puM9DdbdyvhPWSJFTVMyfxbHDJ9gheWjGAF
         BfZIU4ToSzZeh+tHH84sBHuqtUSxXCxndDTq/iv8XzU8I95qSkmxqk7spcAuk4ceq0GQ
         3DCtEilHNfD1kfXAo9eQkXrBdqVB2iKro0LRstNkaJ8NeQZ/kKYGBb/cVccUHzn66JyZ
         cLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430119; x=1795034919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=xISlCVlYIEXEJaHfjY8enMbJnEpkkvJDWpCMYm2Z+pehzAtE/U/xWneP9rkFLGAk5X
         8OarT9i/GbJp9vGBTJngwNBDleqmwtUMKlxe2azwI/twtT6iApKbOJ2Rndd+oKqfSacC
         ftPeWza8GMz4rYXcTbDX+H9X9JPde3GgNnBoV7oGs117VUi5I0i/xV/jl2E29HOZrHJB
         ixjOhqpCjyuzE9VXfo8ZgSBsFhx2wEA05xu/Xz31uz4ISNjn+w+zcN73MQYY42Z5RmsM
         YONptwPCB7wAYxIUN3khsnbNpJIO3OIxI7gAYkP2OpbsflLuEZzuGgDNHx9AwN+oTY1a
         8vEA==
X-Forwarded-Encrypted: i=1; AL+hErGF52aHIcdeZRPQVqgEHQGJsr9MXRYkXsuvkJjQ2cCrH3Hrl/iq6nXiOYBribFmsUa3e+IjuHos36AeqhSunQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wz02PpZ6ps7PUgglZ7LdVobhSPDx+ZE/wvlcbfXoy8chRXkJa
	7s8mT6EIiN0NRBpfLu8Mib8BYUjufYWzIrhYf1XK0Z8WBaAG+iUlc3ka
X-Gm-Gg: AYBFou3JfKCSaY2r+cKWS/76uMooRPTyTjx2vb9w0Mtmti/mlBBo+vHQiMouUCSBf1A
	dIEmXiJRDSK0pEUkVWG5xoYtUc5ZSGB3s5tgcNTOXdCSk+HIoUYxSoG7EZJC8Fx/FqY7noPKuyA
	rNPslLrqL6jNZzyF2NKROytG7uv1D3qI/DeWwGOcDjjygEvcq0YuR/IyTFzAdua/JIM2zNxe8YI
	k9ZHriSl/IKOxHVocnTNI/jYPyb0DjlPIepJ1aaTj11YzKQ5eN/U4Uho4GmqdRRKPebwDmv2gl7
	TuOAdMC5+gCoWwO3VBmnZuyqS19JOn2TkNMTv4G6vaAd5mFOvIwy78jQAsVK22AKP3TLul9UZEY
	00X6gpIGsYX8wkKvTO9j2VVnehUQhUwyc9cZyHcvCUOWoKQeZJv79yBPcQlr7+LbJjuyxvjLv7p
	iVvnas+3eUIN7J1+FIzbQrVpfD9XUVOfs2cJ79kN/W3SgXZrqsaX9c9gHqLOwTKoO9Hg1+LMUa7
	Ts0Q5ZC548O/QUsUb9NiiMwJkZZKa/ULN6U15XEzy38lqw0YGPOxQv1zUgwa9bbDXL8s0XafOp5
	UmrVM/XPElyaxBsIpFqZgh7UHmlpdiaTzwqOn3/zoT448PL91oZC7LFYxa3Yt1tAg788FrQBt/3
	CaNWRZgl5KvKSpD7bnQWU4rVUF7BCUhRZCFQMMazK7wa3MuDsfCoT5WYGWvyop2wD3XPN5YaKSn
	RxGJQ=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ba093921f6mr66956865e9.27.1794430119321;
        Wed, 11 Nov 2026 12:48:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:38 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Wed, 11 Nov 2026 21:48:23 +0100
Message-ID: <20261111204823.88785-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111204823.88785-1-gsustek@gmail.com>
References: <20261111204823.88785-1-gsustek@gmail.com>
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

user_stats[] in struct htt_ppdu_stats has HTT_PPDU_STATS_MAX_USERS
entries, but ath12k_get_ppdu_user_index() searches only the first
HTT_PPDU_STATS_MAX_USERS - 1 of them for a peer's slot, and
ath12k_htt_update_ppdu_stats() applies only the first
HTT_PPDU_STATS_MAX_USERS - 1 slots to the per-peer TX statistics. The
last slot is never used: a message with HTT_PPDU_STATS_MAX_USERS
distinct peers has the statistics of one of them dropped, and the
remaining slot is dead memory. Both loops have had the "- 1" since the
initial driver.

Iterate over all HTT_PPDU_STATS_MAX_USERS slots in both functions.

The messages with num_users 8 seen on a QCN9274 AP carry user TLVs for
two peers, so this case has not been observed in the field; the fix
follows from the array size.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index f5c526bf82d8..a0f98259ee64 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -46,7 +46,7 @@ static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
 {
 	int i;
 
-	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS - 1; i++) {
+	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS; i++) {
 		if (ppdu_stats->user_stats[i].is_valid_peer_id) {
 			if (peer_id == ppdu_stats->user_stats[i].peer_id)
 				return i;
@@ -362,7 +362,7 @@ static void ath12k_htt_update_ppdu_stats(struct ath12k_pdev_dp *dp_pdev,
 {
 	u8 user;
 
-	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++)
+	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS; user++)
 		ath12k_update_per_peer_tx_stats(dp_pdev, ppdu_stats, user);
 }
 
-- 
2.56.0

