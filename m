Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430119;
	b=QOBpCr4Zz8u+sDjcHW1AhiElQ/k/uNC5e+hHB42goB1qlW2Id50+UzgBZAcT4dJWM95w
	 db2ZKKS1h71yFQM095VqryBfrdzsRG+E3FsGQWi0D/r5OkEmUA44AIYjpeYmI7dnHh6LS
	 0+Ptb+EmHT/F929JCKjLuxShJGHl06S0JeyATJRSra3QXtc20//vwSWGhl2sSy8nMzae1
	 Z6uHw+LKeFNNZLBMcDy/TMmg+BqTs3J54IKVsf6VmVmDxCyaZh7jX6lxRuO+D7qgjUh8R
	 ZSWYQsajFrSgiNpHO2EgwotasXwby5GiAtgHs5uNOULmtrE/1wy0Ooi8lljgcP/U1Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
	b=JEf9lX8jsg/zOMA1DMbJCfaVLKIM3dPrp73yq4ju0FGXantmGM+maXegCuw0gD7yyDd0
	 6tyByEcnEgTFlaMZk/E9eVHrdl/0EUmjAq05E8TxgCyaHXDafNFqNhUe7LnPdrSJYSpg3
	 UK00v09dm3FguolzcH24ppVLbHA3lbtR0/5/d/gL+vzACzY7zez8nCgzvRHIDLiGhGYoz
	 CcQnAjqnuJ/0NL1++Ye9/mXSu8+PhSQObaNAoO2s3nA8gL+H/jrywNpX42qT1r3hh+8ca
	 CoCa2xPqwQy6aqfJde6C6baFG4PkjVUzYZxfo1qbNpAj61sYUsfiZHqXsGMIq68yKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1TTK1Rk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D07606A339
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 20:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D07606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1TTK1Rk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21234255e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430117; x=1795034917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=D1TTK1RkntaqeSIu0pyz0K+rte0HRE8KoF0FVtJ5kJ1LObGSzqW3uU2+0dNdjh9gwM
         PWCyX7XRQ0RXAB3tfrX40Zhn93LfOyD+micHST3Aew6y/NYhCICRyfwqHxLh84su9WE5
         b+SjZrOomipSzzi3PW8MLZ5zOchhqoZq/3R7P16Xhmr1tUJSud6oixsLYPrbSiaHr0ZI
         DIQ2uppLrs0IXkdmscuncpPmhJALRrHZLKD0KCuJpRWP7RFuhR/XgAlhMzWI0dVWUxLk
         DJ29mGG4SlWU9vLemNJHhEBCDoqMHhONCwis0/FWCl3opaiKwGukWBmwMRzOqiif8iSx
         Ffhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430117; x=1795034917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=JsD8AcDOLmGBu+KaKVInSFqeQwt1x+hux1rz2NgZbws+Oj1h42kYlyblrYXEbAk2Vz
         okn8hR5ObvZC3XqzZ37kZvJHW+HGUpsFNBmbnWB/0mAnZKZd92019Z/FUGRmWfj/MEfW
         L+3DAKCDbM2KRuRyvrUNEMta33oOPdbfv2qOIdiugweU7WJ3H52Dz1L4VmSZqy1Kf11Y
         REozCBDXQoe8cI0cNLjlvmw/AUC4/8frFlPDmtHLx07/TaeRTrQdrdgI+8LxeWNPg4yO
         lE/qTrgB09S1tRmIuxcIZYTOEF0oY0Z2X2yThDmM0qA6vK/ifWkcqZ/QyFXSPA4751UK
         Z/jg==
X-Forwarded-Encrypted: i=1; AL+hErHB8M0++8wCHvUiQDemTQPVnEqzIcjCZry6I1rPIiAsgn2HwfaN5hxIHGWE4qo+8/qX229kwSw8BSydOX7jDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PkiElHZM65279TfG57/ieK5Hsb9E2nVtet9D8jAZ8ZzQygDPu
	/mi3fwgJnX7cStYlTJ4dxkUJw4k8Whah6jXuXNQRD6enYmaTspJM2z3w
X-Gm-Gg: AYBFou24kseEIzxXrkixyrD+ew3FH7bZgdbWRAkvr1tDD79hr6eN1YAlY0QBWtZmbkZ
	BvOzWqfBE/5VXj2GzRcDx3e0X0mXyZBQKKheo8zpxZp4JvR61hd71Pgv6IkMVwQ//A0DOEhfZHm
	fqapvUR5YLPinx1r6SO8ieQea+2izgQZPPOZM2r2j0hwMFIbVq3Mfpf6qExVHmN49I3SVotm0Ha
	chWo4YLcWXuwaR9uC0JrqgeJp9cpLfOnWOE30EzUoGSyRRVHQVAJlDQHjcRQ8YYLUSAFfE2mVbP
	rxr1Espmt2HS7mkOYOa6hekZ31uyUJsyaaOSgExj4Q3IbupereKAdNXOG7Lgfkd5crX7BGWUn7C
	alWDqMfEFOln6p8ob+anVS70J3FCr6HibUi1gle4sE8lKjsuRrTA22T0853gnLTnkJGFUIoX0kr
	/2LuYqVg+PTmpppndLoTuQVPqw5PqwLLN8JqRL0bl2PfjAVTSC2ocyEf0ZCBjVheInb5e1UwRIG
	Dtu77lO59zUNDT2mKk5nwNwqZMLhHBln/cvTaq+Oc2CrN89V4yOTYtka3m6T9TluzMlxwkuw+uB
	uQQxZyDSUTQXmj4fj9nMyV6xPX49sa4O4xgZQoUv8xysN1IKHIZkrS+80PUvYr51FjfjUtin0O5
	AIaNV+WHOCUegELq/Y1D402LaAdQIrtTCtxho1jJVAmABj+tqZIqAFIuvidaBY6HqL82m0KXYGA
	5DuEMX
X-Received: by 2002:a05:600c:4e41:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ba0939db52mr62096635e9.22.1794430117343;
        Wed, 11 Nov 2026 12:48:37 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:36 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Wed, 11 Nov 2026 21:48:22 +0100
Message-ID: <20261111204823.88785-2-gsustek@gmail.com>
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

