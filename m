Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264851;
	b=B1MFy67c317WfbqWcSEWs2Xw/m5jj5fwZif/npchOr8UFC2jdJ2BtpumxWiHl7s9qXjP
	 N2hZwwcAde5HoEADrzq4XAxnvrBrIJczIpfZlofofwsHprzb1KYa3IhyE+xvq9oRTrrD5
	 zZfE37wq1r+cYDjcgNK8M3P+fEAo65eWC7KjPK4s8uWm9iPXxZlIT0H5o7OIzxhoMVoNx
	 S4oZUUznqvDCYa/tRAZhAL2toIfjb1zP5ipCxuJXXBD2Q0Dh3v+sY2ThR1f71h+YtP8Ld
	 zzxfi761d4BhHulolTyiVC3s2eFFGaK7neY/eb8ybZ6H+EewFRTXLb5oECeTkyezwVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
	b=GXXrKxvzgwVmPjl/veZ0vWr6oK85K7TRy7ueCCq/c8jYErvq5yCaWFz5zbprzxtFEEPD
	 rb3Su8x+01du9Nhkl36LaAhjKUCH7cWPSY4nAF9zwVa31eh6WlC01grTzfvA2sCJQmQuq
	 dK48xp5iT87lXuPt+FHJDyeOhdcR8r40M/YgQiy5NkXCK5vzenKBqaGq2lzErhs77Zf2v
	 mmGtz6K/6AHOA0pHUDy3DGP4DUi1yMZ2b6UploOD6+0b6iRBIPHvpXBAkhJ+YT0oiwOjH
	 v00KY0lk/o6/mlOLmrWlNbXIk2eQ/buN3QEk9C/Ur31hlQU2KvzmhFTyyMEeKq25Zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFsGGS0U;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F060A2604
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 22:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F0F060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFsGGS0U
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so10999865e9.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 14:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264849; x=1794869649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=MFsGGS0UejbIXnx+SdptoT5wibrAQTR4QICHPOWdHck6ESFFpZJBwC11C+Djvv3d7o
         cwkNlimv+6HyRDiM89EJvp6ulchV8ywi9iT3i1HjKk2HIXsFBy/WMqzhbGO4h/kn3mos
         pPKosiqExltLmRIqQ328K3SXjMvIqobbkDZHiAD4d9VxEcQC7YHiaxWT0kX40UByWaae
         11N+c+kUiKRw7GuV1ScDefq7l4x59F3BW6WRpPfOk3JwxJR4T84PfpJQV/qwvv9xp/U0
         vg21FziPzgbI/HjUye4ZXphgg9uGIAOM75D6h2yfvVfKoFf1xqwQHq6SKE9GlpoZL9Y8
         sAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264849; x=1794869649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=l5/6GCL6rGZAIexKirg1k9msL/k7/0zCI3vzOY53AgeSUdeFoYeHt80+7WEHXN7viS
         RYl8ur0ezAsONluOuwtePAZjOPX+V+Uu4PVndp+Z4nE6qLLiPm2iDJ+zHno4V222HSvF
         WnFmi5NonoV+mEKZm83fwhmSc0Epz21LULXHbAElN6ND2z4qqUZZB1AJVyXiFhfLvcuf
         b/N8KhZge2dHTvn6beDzVb2ltlxrewhV3YikF+XN2OVv8UBCaH8Wok7Uha2cFa3uy0VH
         Ldqa24AIJZKZKwLSfGpqTO4LhTkdiG9PSL1WXdXbHEiRMC3YuOV4pNb7lS089vdIgnMP
         zrhA==
X-Forwarded-Encrypted: i=1; AL+hErFjq6KRxkvdBq+jF2BBek/60VNX3CG897aUWhjkXExcYnLO0grS/b59xC52JTGQJTwauIDqJFPPKtrzNjIIkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TFmQPrYb4OFLZOR8lLjYpfj+7dmD8SLubIAIlub+vj+yKpiqb
	8GuImKaABc1Oiw/Gx8Y6TD7KwdNiE6z9Nb/6y2zaXIcdWPgnEa/tkC4MnBuiH8gbFEs=
X-Gm-Gg: AYBFou1wBT8RIR/w5hDpFDNnjk9iguGLD9AKAI2tNAgh2plszlHJjLWRBSTng3EUyBV
	1u5hmqnetB1dK0BIb2yoHo/LcboYJAi4SUScyP8LWdyULOyeUPCU1f0L7heYUihLnpoSJuN9p0R
	mgUq4E+EeUGPv5n+3W5Z7Y2kJC+raOjJKSG4Tx51eZDiAJ56xzlnxq0XqVkmUPzy9wkDH6yHK6z
	O/z2SNFRTeAGIxUB4Iw/GdIvQlumLRBNcF7jtSxWWnpnT2IRptIVgSwiHnhICUXZ3Xq/CnQcFAD
	hXcI7bmqtnaOxmF5BSWW1FdDlsSBnodlYmFzyulWu2mSjbNia02x7e69p8YU2vmsQJlO1bX1CZN
	a/vexp8ikwqGXahLzMWnhRonnsimonkurbEBwYAMD1r/AsdaCY+Wv0Wgn4n1RAUsjsuQgDp4dk2
	uSbZrtypGVv+JPK6Vt/DCO4xGoq9HIlFIlVKzQQV/Nw+V0lvQmoMVzcPbOVVzeylsNypwnjwoV8
	vA+e9sWGjzg3fTFZm0K0arvQqrnT1TdcG3S5pU6yYCrHKpP56AgMrMs0ChrVKOOAaSlBOybGUgP
	Y4Jxwkyht510vre/+tZpfCq4wQYcYC+cu8cubcQqfbeYapgEd4gcruYBfy5CJSWwMJ+m8XqkVXa
	TrJFwqa39wb7lqwMH7MFDaV+pNE+L1sgN8OPtwfDg+dJVma1tzxOFxIR5RBIL6cL6h+LgxOF1Tl
	VPnBWXCyF9lXX1/2r6Xeykg2o=
X-Received: by 2002:a05:600c:1d18:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba02305439mr10274975e9.3.1794264849405;
        Mon, 09 Nov 2026 14:54:09 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Mon,  9 Nov 2026 23:53:55 +0100
Message-ID: <20261109225355.23161-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109225355.23161-1-gsustek@gmail.com>
References: <20261109225355.23161-1-gsustek@gmail.com>
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

