Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886907;
	b=guaVW10rOdXbMo1q4QxJseJSwVnZ9ssmYbI7L2M+psPpPCj1y0zJlMe3YwiHBytEzikQ
	 x8PURT9LXuvfmGo+XwIQgdXg1OPMb2mhXDKH2CKuN8md+yDKS8tLuQMH3ITEPMbSjIKVi
	 S2k8sPVk00rk7lteFLk43iC4OzTDB+fl8gPWCmoS6QnQ3EKGlO84NLK71IhQt3nQWLn9E
	 RdAIjrjdzzwi9ChXTe8pUV0ly6d0Q0TVd72cLEbER3tnVgl293FvlHUrQgzhlxhgU+8Ml
	 Pnm+Px5TtsqmQE/IVaBSqdPZJc2WKM2hlFII0ba5lnmDZMdC5XN4nwNGyzoo46Xi7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
	b=RkgsT/mkAOwWrvG0WXzJ8ib7WolKmm1PmO8aBTaW2SSiKoKxnYKIJzzyjBc5EBKd9AO9
	 GUQSxap7AJntRsh99V201ydfTlc0BMc60RdhPGqZpaQMJneWGNI5VtbWiOmZIkvi8ylA+
	 WCr5FK4NaOAwU3+2AHTeIl+pN8qKB+DqB/dsR/cF9cmzKhT7R5ahAtFZY9Waaz2LkH2fz
	 dgMDeYpb2ccsvYFhPfgmIkCTx5DYO/Dy2AQVbGg2V9fuxwXTOdBVq8b/cnKWAWgrUFydk
	 rHUOP8D8bdEYlFCCnTDLE1qGXl24PGCAJzl+sTJ8clAQfxqQvbxgsj2nOApDoUbzsig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ylRIPEyH;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BA606A323
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ylRIPEyH
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1344685866b.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886905; x=1796491705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=ylRIPEyHAyGcc8MbQPr3Qwm1eo4UzZNOYmxDQDQaTHmomhKp+T5wtwmAjvIgN9fzin
         a4A3J/MnaUs5CC5rfc0bFMGo2e1P/67ETvrMhM6tk2QYyffSR20nA23TQUN2a2ZuOLYj
         +kPWD7CM3o3OmneGaZSuz5Jjw31YXwsYKz9412HxxAvJzsbWMVxf7askXqt+hnEMfZ64
         RuLmKe1hZc7LcsEUsk4y9J3I3ixMMOlXmt1FLUb2D8gXZRAgDWV6BmN1Ky6oGZv/0R+C
         ubiMMGjol3s6AFxKOzh7yl5wZokKUq1HV1V6BECNE62QkjpQnizC2ZMun8xxkcMu3fVi
         OICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886905; x=1796491705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=2Eno0rmTt5aun5Oz1Sandes0yeY5PE7s7+g/6ge8FqY+2eYtavWBgsgEmkxAWumeto
         CiQOJBh464oNOpXITLMjpB3whztVZp3okCls9UEx9pCrDnseTxQEJjkfN9u4o8tT/upL
         ekqduCydC8PrDZHtCsZjMSkgt0ugSxZzQaBCrc5gQDyseztwx3Qr7+L0eYmcW3UE6tCL
         XtFVlsDGJfhUB/Q3m6mBaH+oYI3vnFwS+z4gYjMuYO3mtEZneEFm11yb6UrsnIli0vQM
         hGxNSvCNS02iuVxVafwklnPvSr+W3SAlVeknCI95sIha6m2goS0mAyQ2zTwo/MsrZRwu
         CyIQ==
X-Forwarded-Encrypted: i=1; AL+hErHQ10Co7IZ0LjpGhX3APpqGCrpiuy9EO6aFXqjebAE/0dC7tA8CdwgvQ2EqTfxNMHpMOgwkBgLrlPHfSskazQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xgZfnUQZ9kSb1le/iEA8ZzUcScz/6cDQRD1rSVnZzr3oJKzgS
	6YtmiKbv2KAEaO4SFp4r5zJzhZDXRdXWM9kLdpVr+3xa+a82E6KNQ5VsLveAM+2iK1O5PK8UH3s
	WaKE+rgnx
X-Gm-Gg: AZFdTZcGZRd1qhM/X+9p90P5opTBtWSsnXn8pL1Qp+KRhzGtZsAh+H5Vn5P6++UyI2A
	d4Xvn67RcPP+Ov5plAPgnSi1zWx8x4HREATGLiTXpm1pC26q7grtdN+FQQkkGCTIS0I50zzEuQZ
	4BhzXsPrS2wVKFfUpiJWUh7DfU6++rR3kVNCiLoEfolKoryt7Izmf5pdHGPB4ugdJfkwIvSN413
	1Eu33qVArpMmLr8rJujuSPSp9NDBIrVR1OQfT6xKTsiYt1rCLULUir68+AmAcq3glx0hLeeYcw2
	0egpoEMYp23kJzgHbh9RfqPkQhlZBAFVCJxtCfGnO9SaTcwICydWtZnPqtUuojepnU/op494pY6
	RRKlCXbyngYvoPvRxGOe81IjBZLbYfcBCmIEBT/jSyedhMWUKO+kUZKHtL3JEAy1BY3y3VLc8Eq
	onjYrHfPnqusJyRlsc9aguRk5TEmWa3E4nA2czg1uqkh64+4zlYuDDkSlWjePadGTJMQ67j3ItY
	af72JWTsDvNMFY5Jxp6MU8y3s649abep/YXHq3SVuu94RBeC8EzzaIhhGe1MJE0anxZjj4uAc0L
	jbBlr2PzC03qX07m//6xTwmWmbdumKXtYwK/CEP2n012w5Nc0AxBVOtYwTibAVxBqtzqpGXefoR
	yD1/Q6F1g/mhGehyoCMjnHlCthSnu1mmwOw8rz4WtM/+wxNQZDhr2P/yW05nZeku8kw5VbioOTX
	7307wiN09XzdOzzjEcN2ThxBl7Ko5hI/dgf1eUG6fSCBkw7LmX1Pns84BmuYKi/fTaXG06GkBw6
	QumtMpoScuH1PlNbP/aTt957CI5NDwVTe7/hbbM79k6v/yUrsNbC3klJz1q2Nh5YKzdlRYovVmK
	KUIJ6wifrD9Ntw==
X-Received: by 2002:a17:906:99cd:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c5158a29e82mr1859064466b.8.1795886905085;
        Sat, 28 Nov 2026 09:28:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm976442266b.77.2026.11.28.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:28:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: ignore the PPDU ID format indication
Date: Sat, 28 Nov 2026 18:28:27 +0100
Message-ID: <20261128172827.1168404-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

Firmware WLAN.HK.2.12-01460 on IPQ8074 sends HTT T2H message 0x30 each
time it starts, at boot and after a firmware recovery. ath11k has no
case for it and logs a warning every time:

  ath11k c000000.wifi: htt event 48 not handled

The same line is in a user's boot log with WLAN.HK.2.9.0.1-02146, the
firmware linux-firmware ships for IPQ8074.

The message is HTT_T2H_PPDU_ID_FMT_IND in Qualcomm's public fw-api
(fw/htt.h). It tells the host which bits of a PPDU ID hold the hardware
scheduler's command ID, ring, sequence index, link and MAC ID. ath11k
only compares PPDU IDs as whole values and never splits one into these
fields, so it has no use for the layout. Name the message and drop it
without the warning.

Found on the bench, from the warning in the kernel log. No security
impact.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The warning shows once at every start of the firmware (boot, driver
load, firmware recovery) on IPQ8074 with WLAN.HK.2.12-01460, seen on
the bench, and with WLAN.HK.2.9.0.1-02146, seen in a user's boot log. No
frame or user action is involved, and nothing else goes wrong; until
this lands, the line can be ignored.

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath11k/dp.h    | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6d..bace81c453e16 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1033,6 +1033,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_PPDU_STATS_IND = 0x1d,
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
 	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
+	HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND = 0x30,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..c65bbbdc267eb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1747,6 +1747,9 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	case HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND:
 		ath11k_htt_backpressure_event_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND:
+		/* ath11k uses PPDU IDs only as whole values */
+		break;
 	default:
 		ath11k_warn(ab, "htt event %d not handled\n", type);
 		break;

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
