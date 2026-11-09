Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264850;
	b=toLpHSOrrjpwyv3SjC87fwSuB82lRSejuU1IWRTy/qtnXldo0SVbRWHJSQ5SZNQebjfR
	 KUUAm3fGHzLzvh+RUHtMda7iMFEDbLW8EE6RQKkeN/V+LwCbbrAXKa+uUjp52cXpKilY/
	 2FmXy57iNsgPOUgEG1Ep7sAMapBwpQYWNpw03CGVaPZzjjx8GbHo1LBGt7sH6V41rvFW9
	 HxHKIBkleD1iTFF9P7BB12dnr8PZk5H/a3F+6hnx2dg/Lre0h3g3Ow6dCAskJFsKd5OVh
	 IhVS1CoCVtGg39ZbQV5StpbOtm4VUD52+YuSKd1VUDx9nJN36VhR1UukBC1ra+QSm8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
	b=lR76lilHE+XnjFkJfQTtkPD9XcSzRuIOwkBjAvkdGqkw1dp4hC+8pRQizZLz/kP2WwPA
	 dCvWWxf4TGZ4EnEmr8UrHeKIApFxnsrCxtVm4HbK5ec1KA24qJPXcpBe5C74JysQJAhzJ
	 p4uCsM9VNj8jYv43DDL7dwP9LBlkOTBxmML+8yQZSAl1OQVVgL4bUEc5vITIvpaeygoIf
	 ilWZXRyXqUtj96FxXf6UP8iC8pBUpw8xtdsu9yyTEjJBR4iHYg9PzkMvXXidGiD5DXhPn
	 bleCgpcuYP/jfR3Nhdo7+enc1PDPiCrCTVEQAN92X2bV/+fNOtdKAo5KieN0PnU7hEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPq6WZvN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8952606A332
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 22:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8952606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPq6WZvN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so14873715e9.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264848; x=1794869648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=HPq6WZvND8WKGs8x61EfcbU1tTpqQCaT004vY4afRh/RaPz+vr8+/NfAGCrqHl1FUF
         R2hScXb0CJDoQ0E/QSvLPtUwQNd+n8Mpkuu0AQIIX/8QawijVGqZa9RlMeejc28hBGxH
         1KpB5dFRYaW66E+9Cng7JtSt9BtKl2jYp+zhr3P8rHZe+CuZ7OVheiGHLejVx+4B3yY/
         4Xh19eYRzRdG8C+TF6IWM6dY2Uc7QfgbfAUbeZaMcjJ345g8Z1/Nx9nSi7lqCKmIQthY
         2mnbBN3UwcN58JgPAGFTQyEY0UIFyrFJW73GR7sbB9eiVFZdfVNQtldhMAXyP3DXNgdS
         lMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264848; x=1794869648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=sIiIg8cSjMkghSNwmTV9rBT4ztj+3ks8KiJCZJiZvaeUSlYqu+7UGpuuIAVDfSY+DI
         6pNJjFjuI2zhsKihil1lPQSPWNI7YC/IMti6UjWK0NlqfEXLAsRS8P5K2S60WKFTv0CY
         KUZvKXqvfSCHGqKsqC38+3OT5x1feRDeJF1lADqouyM9/cA0rDe2tnO+QBa0mLHjowLq
         Do6X2j2rV2NPipAkuvZ6LCjvFo/+tyfODossQbseKV34aGeizBG64RJUGT8SffiM03Gh
         bF2chvmcoKpEjPCai10H9GdQZfX4+Tswf0EOo2jq60nx7ShlcB294z69GX98B7TlwwK6
         kSRQ==
X-Forwarded-Encrypted: i=1; AL+hErGrJkYuqDOXUo+fhao+VcRwucHt+aim11Ord78STvAn8Nh4eaYHt6qHfVVAumfvbKqBoUMoPBr1GTD7dZJk7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9riKVrv7C2AE7sOWoJlJjDZ7x3KugjedfLI6Enib/jqibspxR4
	IamcJtxy8Wz8osNykrjns44QNnVcNRfZqkj0/RKuZUm6S4gU6aCDqAO859zifh3dMjA=
X-Gm-Gg: AYBFou2onEWW/ykxJduVoqIlVup0r0ekEs65eQz3IRawlzNOeBLXIYN7JDTQMX/ZJh9
	pvLh89IZbqA+F+KJoYsAbdiVbB87Ak+fo6bB7dFUdwegK5qlpXfqzpQba2gXyCTe4vk4F3rjnY0
	ApdFoimZDBsLXm6Kou2hvEMCsAoDtphd1tPTIeBWb8Kh484CO3irK1bR8D47bA8t80GjPQhAUzq
	rf0BEdtUSvxPXRq6e73gvKXCtbzGsntiuj0arWDh03yUNP11zMULmUCoUDT2FZwXV2kstfbUvs7
	1njvGguRAiMKcNIU+RlKXJTzjtKbQvlKpSb9BT+9+Wv6B0iZYS1VHuqeU3i4sF6Yoh2bjz3Ui3n
	Xr9BIa3SVHoir7gwjj/hbUaPeNN6rRZGZJDRtm39xngKqFtLaIqxj2FAUuVYpogtDkYqYCt5WqY
	li/qLtgitBdVEdGNcDim01xmiSEIo/+ojcYPhXyn+hw81eGcsz42NsmrzKuQ/o6zWmVSMBbFQB0
	TDdzqoyb8Zi1rK9yuXbUXVKl1Ei0IHyhamOYhSrTAuqMP1osktWgtgpTmWVVYdD9Ly4kaQfs7zW
	W4/Z1+U3B96KvplVeZwshkKsUfIFfUNdnpdAmXmpEuDQ3KPC/tjkFwRx+mMewinYpuhQcvHCthE
	d7uQIb0Y56rmhIo0Kehd/+kp1T3UyOjH4L0dfpzWG82F25UXyX2kGscGGhHmaN4eGnCV79wRdbj
	xKs8fI20nxiMzRKn9RxybKdLU=
X-Received: by 2002:a05:600c:350c:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ba0233bda6mr10446175e9.5.1794264848501;
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Mon,  9 Nov 2026 23:53:54 +0100
Message-ID: <20261109225355.23161-2-gsustek@gmail.com>
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

ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
guards a loop that iterates i < num_users over user_stats[], which has
HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
rejects that value, which is off by one.

QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
otherwise parse cleanly. One AP with two Wi-Fi 7 clients logged the
resulting warning 468 times between 2026-08-17 and 2026-11-01, always
with the value 8, and never logged "Failed to parse tlv":

  HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8

A diagnostic build that logs the TLVs of these messages shows that all
of them are BE MU BSRP trigger PPDUs (frame type 25) carrying user TLVs
for the two clients, up to four records per client, and that num_users
matches the number of user records in the message. The same firmware
reports max_user_per_ppdu_ofdma of 8 in WMI_SERVICE_READY_EXT2, so 8 is
the largest value it produces.

Accept num_users == HTT_PPDU_STATS_MAX_USERS. Keep the warning for
larger values, which indicate a firmware that supports more users than
the driver stores, and adjust its text accordingly.

Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..f5c526bf82d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -487,10 +487,10 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
 		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
 		ath12k_warn(ab,
-			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
+			    "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
 			    ppdu_info->ppdu_stats.common.num_users,
 			    HTT_PPDU_STATS_MAX_USERS);
 		ret = -EINVAL;
-- 
2.56.0

