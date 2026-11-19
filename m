Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048149;
	b=NURGQ+LQ83j5In1oKSZladq+hY4L42AlKu42VorzIK4yTaZV2gfrX/mHl0vsddrqxuPD
	 n9cJqjl+OqO3ucfvZG84otziz793EMJf3fMPOTOHPlz/z38TjnB+y3txDbV/zHbqmRI25
	 T2XNCuUjXuOO2LgQh+Hoo6i6/x4TBlnW85Dt4k3LIJM82w2gS84CrEVYM0oEQXT6/gNx5
	 xbafRzsVzS3/x2QUxaM8bPr7+1CTQZrVswdIwmdRQXtORZo5lz6kpUosrXd6I7TepY1Ln
	 zJKt92FZ8qvcz9nGH+9G85RruPmMj/RjY6yQxKJVUITQ1p53iIHz+VsWBwn/PM2+5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
	b=kLqwnHa9UjgcItQTkLsYPKAhAFwA5r6eAPdONVi4q4xrQb/v1lXpmIRw9TQTaLA0Rokm
	 +Hn7EzcnYjsJDnm4ug2gPbmD/QAiqqRa+t8Kr5ptCzbGAXIQNPbhbGIuKyegOzytqsiql
	 CrTPIvZgSvvnkItlj90BhhXRCnglxa1PuX9AJICYuIKYARN2Qk71E5lTjXrTJbiqncV2y
	 VLMdXcTnrySygpl0LgfksX86sZOFfFzAT2sdXxoShty2bz50gCL5CyJHHEL/XQCN3qkT8
	 2MoH/MfqKzKl6biY0USA2Nyb95uLtw7lSFXORMQSFtDCBnIQNj/WhGfu4g0UuWDmd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNosMmSY;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEF606A33A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 00:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCEF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNosMmSY
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5364042eecfso19581591cf.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048148; x=1795652948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=LNosMmSYVWnJETNENXouh3pSxSOcixqfbVhjtJFB4W4x7If/33+aNHIddZVsFFbdGZ
         WJLKx5XKzdzp79zwfIzhKaVdDqJ9xW8YaDzT5Goc03+rhDMuHU/sVKfeRl91f8HQx/bU
         2RAAKG1Phd5ZQtIVBcNBxE019+G4lGoWqy/J2tOXkoqcOgyOn75bysQFaqD1edQIv3A2
         FKJ6iMJZkzFS0z6zDa+IfoKGFW1ytliU50KTxI0dW2DOMRUGWmaK+VJbLJkCXO2+tD81
         wtfPAxQdXqKA+U5tciIsFvE6/Tk/yq74Hfo/IKJa5NuA8udDB4/G+AJYUeOm1uofhQ4g
         +kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048148; x=1795652948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=G0N2eH6ORdaiVAeMGJZr9b/cdMCDdCP4rYNoGI5jFEfce0E226PfrEPK2ddUCT39t1
         MYk5ODPn67dgSI2cdt4n+VGGjYDEInQ0KijTAvpbwJuEYn16ylIymOVuT7pqFol8/ofo
         k1U/oqFvrlzFNxGylBJBW9xUty1FXFtXIP3UtJ1RHmTcHHG142ze2DsGP/nVf9wZcGJS
         Q7pgBp/lOgx8rthtcrx1io5fNv9tWOiQDxPvDoY2+bKKH3aFm+rWzwy8Sb1EiUm6T1OC
         06OFYutvs04szZkv1WNPhS82P4bc83L2lK1gotcSZ94o14dxixHqXTcaB/Ykn6u9YeMk
         Bqrw==
X-Gm-Message-State: APuU4Z+FsVoO3M8VEbfgzPGZ3QvO214UeBB19a6o0psJwGtamZ74MloF
	gIJq7m8UqzIjRhXbm0N0/SeocuUD4jpkztJsqs0vMbq+CFWcIFD2kqbD
X-Gm-Gg: AYBFou31ShTU8LtQVf5AUp7UoDIZPcjh6/HcVj9stF8Y/RFj47mA6qroA/h+olUJEyb
	AaOZksihSYaOEcpF2WyCbyUA8TgOBBXF9W0x2WMddi2mBCLS5QiATvNLkIj72h/ulkGQA8f8/yB
	vzUYxFh3M/PaDXAXgamORK/Mn2+j5NrnOefB5GutDJ5ftjA1jAegDm/pzDMTswJTiNJ2rfsUWuD
	WEzugrT7tktZ4Q6Z7KPQwclgikeK8Dt+7RSVj0cfeTymrCa91frF9BdbTCWipFOazB7Z3VVcwhi
	NhDgh72oUj5D5uZh7nteQThZeDaPbJjwzW0YWP7wrbyYaMco3cEVDbUbQFDrpanJT4QpRHHQuXw
	0yYcXBHDf3pza93427m/VvUQg+xfZhJtuKBMjwKtZS+icqaaB6eEdyxEvtyIawegBhOwzkVnr5R
	82OKRwEYKXb6daMluf1kDJRwl38HxFbp8uh+gdrmWBj7cTJJ4V5JeHt3Ck2tQjzJvb33wQs7kVo
	ftJZO9Wkci/LVQCzFRjiWLta0kj2LyQ9spGL9D8fhTKXFf8LuTP4Jxh+sQWySO4y34Ahq/m1DI7
	1h1J4tzVtJoMlQP11Vq18cq18BqjDZV/fdGunNgpHlx2sFN02FqS3uftYekBalUAzvds+6YOmlw
	=
X-Received: by 2002:a05:622a:2b0b:b0:55d:33e2:a351 with SMTP id d75a77b69052e-55d5a537aabmr69062431cf.15.1795048148019;
        Wed, 18 Nov 2026 16:29:08 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:07 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 2/2] wifi: ath10k: drop extra skb reference when HL TX fails
Date: Wed, 18 Nov 2026 19:28:58 -0500
Message-ID: <20261119002858.425666-3-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119002858.425666-1-lcy8047@gmail.com>
References: <20261119002858.425666-1-lcy8047@gmail.com>
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

If ath10k_htc_send_hl() fails, drop the reference taken by skb_get()
so the skb can be freed.

Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 298e6a092101..7142dc1c4eb9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1383,6 +1383,8 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
 		spin_unlock_bh(&htt->tx_lock);
 	}
+	if (res)
+		dev_kfree_skb_any(msdu);
 
 out:
 	return res;
-- 
2.43.0

