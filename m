Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502011;
	b=cGqRbyRBSvvvzQ9g9Gymyi+a7gXsh8AHXrsySsTSAF70VuL7zOnNTHXg5QewJ/kpnBXs
	 S47mtOeuAovZRbav9zSgtuwnZdJLD35sBPKDSOlkZoJMV3/xzzGJlpRpKalBJbHVDlbRt
	 I5mooz3KiXu538Be/APeFvsiM2pEGxYVqO6UycY7+sHlusYNScIU5egeCEq+i2+msKHs5
	 MK+p5ilbjh/LlU96Lj97t3Q6G1jTTDAMLMytsZ7NPoDmDJ+pTosDGOQyCxN+GLLRV9iFA
	 0CWWphgxFlOycUKeAe7/AeYKyJ6CgqgPREXtEUHmxuuOfhAzBY6n8QIRimzcjZ5zUuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
	b=dBEp6jopJ4py8LRkplSwU1Gb51u8IU/Gj/O3M1J7cnohu9W18DFMIPsRUlDNDIyBiKB8
	 icftQnl6dZ1ANmzHjlj5PpeKssqoJk1B5lATr7ImydAaMbORbutHtmvarhgVe3TN9ijMy
	 Emj34j9DEbrK1ZJoNr4+P+l/ZYpF98nx1c5eBC6OE0jJ9JbZWFf8bAje9vFxRhvBwvMzw
	 jmkJ/6cSWTpBANdav0lCndqgl2WELhYuUB0Cud2btyrafr5hTu9fsSvWb/TtcuylKTYfV
	 qU/Y3LTA4Zxd9GuQRLXLDsPNobBUL5HGdGdPKl53McxD3uHQjkgZjdAPWPw5JWPpu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qovwseVM;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F97606A8B2
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F97606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qovwseVM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso8022801c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502010; x=1795106810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
        b=qovwseVMh0eea2nriAw1zGMkHfB2HG0lh9EmNaIy6LpK8BDrMkQciN3/13P6b5trO2
         Lqbd7QkRbfTePuohqZQomcjeK9+2Nu1hveG8plyDf7/KVW9xjL7ETJXOe7o59G9O5non
         fRrm0FG4HSMaiGxiuAAR3FkpLBvmhFHcANCseAB+8QvifSNr5YLcx8hq8pMWpDB1rcJ9
         CZ0Xkq67zILT3Mzzw6GRYSOMChSBjivMyss0/MJjTOp7VMOGkmWHLa3K8BLJvBmnGFSH
         GfkacaDvalGW32qjIjNLHWVolsb6T7LSMRcYdVmXNDx1zoj2w6+uJvT/+m6+Mz7Bpehh
         xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502010; x=1795106810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
        b=2Ej42JSIHzsnhv8gfKvj7xxEQXCC7b5yNvHTciFkyYGS7j3yDsTlW5+NqO9LiHEcJn
         uJlmgRvkIVm2FUa4JrAIb1zeLhMcFtkpb+XgmfdJWer4GygKqNa5K3URpuztsaikBzXK
         O/l5cIXv3N8XWo8oZzzVhhKCeZDUct9ChLPXyKw8ScFTHpQp3lVLwIhcqKck6d/K/FNJ
         Bj5M9C1DkRPJaJ6n/XjQXnK3q9zJaXs/Xr5xxaAagiumgPq8CGqcssI5GgrltLZTvH9Q
         jLZmzOzg24XFWultckq+aZyG/Ut2s/0WAViP2UqV2MLResN7Z0v5JFK0Bf6cao7VA0eY
         PTMA==
X-Gm-Message-State: APuU4Z+MyO7qZ+pKVTeIPsW+c6M4Kkt+lqEaKZEMtCSklG9eiGiM2yGg
	yeatWY/rVj5yZe9mAQtx0DxTcg2eoBqKugUH54ypwd+8aJuuSNbJ/xT9IS/D85t+
X-Gm-Gg: AYBFou26SAwGtz9Z9Fp87o1jLgTMEAtYR5yeDdWXwLQ4loq7fSqVFVu9aCh7joqOSBk
	ztx6XQWlJdTZnKcwCIZ+rSed4N91sei4/opkbnlPFDT+LysP//gHXWknQ/k1IbI+YRWO2Rfpby/
	FlxTTSDuTlKf69QFmbOusuHNb15DEc/zyQgKOsxFPJ2qqvWfVJbdIhx2gC84T+evVhpsjFo6/YT
	O6YeVZ43sukO7cYuqKj+f1azMPXHIUz1jpVyzUJbHHmDml1/TJMH/bSDGD7srhB5+ShUaB9aypK
	4BmgcJFfp/16ETVLE5pJrq6Zr/NCA8i2J5aPPBFXYJZFKeb4TYmQHJPltQjF3nwRqq6ROcqTLF/
	FeTsq2cG3nvood7liddhBxbXz4hAVoLVxTM3dVMs0GmgYnCY9eU9uHKkn2B55dwbK8W0THf2abH
	h3H78bRIB1uTxeMfRXeZ1u/kK1fdr07MwyZ+6coVzRJlMlSE/jG+bImQh+/ffRPo+Hnba3nmEuf
	MvC4iS0NeJrm2YOh5sj74NCM9839KY5ahuKVT1ABM/umRj12ZQlNgv9q4wHCbAvIuUXt8pKaCJI
	n3WP+xkt3lZFfqKJdPGPcHrdU9PDwxzcP5BqK7woIXWWuzifdMAMODQGp1E4QhC3hDnubTeOt/Y
	9GdI/V2qA/c0UddtXQ66jgs36Q1HsoMufXGVWsahwd+4O
X-Received: by 2002:a05:701b:4213:20b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1b503191ff3mr100573c88.30.1794502009885;
        Thu, 12 Nov 2026 08:46:49 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:49 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 6/7] wifi: rt2800: support A-MSDU in A-MPDU
Date: Fri, 13 Nov 2026 00:45:40 +0800
Message-ID: <20261112164544.3176458-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

Set SUPPORTS_AMSDU_IN_AMPDU, which can increase throughput.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 269d621f51..ac62b56280 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11838,6 +11838,7 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
 	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
+	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
-- 
2.53.0

