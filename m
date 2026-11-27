Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759994;
	b=SerKPSlvobFl/aINzIAkd6D8P6NfIZjFNzFHFIfELSul4FNRHsQNbPUf2NGhfRZtCSdw
	 udmFARLnZDxfBoP0fXTqHpgLbRniO7B22VmgLEXsE1dlosyoKmo/rnYSaOCdakb+0lbAC
	 NxJBt6iFyGGpj3OV+JR/8mK4n/NA3Q6YmEOIvt4lokXYLYJrNz7rWJexWurqpH3acIKXv
	 8nfHEA7IrELiY0jIZQOMCgslOZTho/kq74HVcsRu9QJemfrNiaBHvemToR2ZKGk1zc2og
	 1JrdyZhOzYSMFEGCVoyL42Zj98sjs5Bw2ZO2CXmGs2OSU17kmbKF3yuMSnEOj6Ekhaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=4ahibbZjZgaGTQmXRnsqjronp+ogB7KHC9xnEXbGUTm5VXCn77k54YJ6cmhmnqb8WUgO
	 lI0LSgw4qqfGDzs0iRIQ4u+++llNZcOu7xaJIgpZAInM1WuMbgw7vzwpVXXLogRkNbe5r
	 jQQGaIx27hHMDIBUpfDy8r3Jhijin+GPwNIOBoyetf94c/UH5B7/1shshWdZ7Mke6I8Ey
	 eHsZ1SiQk2xQLf1KaNNY8mvzrKO3OVdJ9YnxdWxaxP1VUiDW+C2Qbhi5Y1vUEsRJVht5A
	 NCVkJoet0jsMWZAsI6NMKv6x5/OHEMvJANuNkegiDQVsejb5oD+odfOISJvifzBJRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjFzfz0N;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110C606A32E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4110C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjFzfz0N
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so7186186eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759992; x=1796364792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=IjFzfz0N8cD6ic0niqLenp5ugzZ3Ji//a5Dj8NActPbt+WY90UfXQb3oECKQteP6kN
         BqNmjWDZZSbRxQpzD1SK00OjlrxGC+t2Sqv1ccpHXabanp/jG9dXvEYZ8p3XSldxOq2c
         iHdmdkFyj3IAxsohyPyLzoujV68ilwMAzVONqBCfTnDHOhngld/2zAvzTkG6O/AfdKDM
         BXWMj+UtCXb5R9/hAqX8tWE3tInYVWNPbvhfuzvsTU0qxWjbKYhb7Q4rUglArvTjD3Xj
         rlgUVgagZh//9qrdeWdghGsh0qtzLVCvoxtZ3VmZQCvlJ8N3RdlyXMFHrJEiwoUZPTv6
         K8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759992; x=1796364792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=cUyaKlOqaJxQDBjXCK25Do7MvNvXohDnoWuaD8yybBFYnTEa+mLT/n6xgoXAVfKYh/
         HO8M0elcknHR65Uk8TVt55UaB9otRQoDsAyfGqkXVvtal48qIGOIL3+TcLtWBmjkNP6W
         bVhxLuS1nmCtvt/T8P9JGgoPk0RegekOvI8pJ72B/ndDlVpfGpK+xOrRQrCsbgvUpckE
         JBaNZFxCyjBC/oThelP7ZrV541SzsArIO8haTRIegS4tTvsgJWgheOWCFqqXm1yqh5pZ
         Xkd2ECIE2ULeiTrI/Vq1wE8cnVUziKWiC9QwhTf+1HsQTNQq2oSrsuoazCb4wSbfiPSS
         Sz6Q==
X-Gm-Message-State: APuU4Z+p5z4umfksPlBIWXSOjFwlDUaI4IG5VtBd56BTogna0yitkHjY
	SEo+orGkzk0esBeQY9AUZw7YuWe0k+74ou3xBWStKYBJKAZhWN8xNO3IOpsRylJOSpw=
X-Gm-Gg: AZFdTZfSzwfsj0O5DxrUnoJhCt1scZ11UTvtjqrCCjqAhju/Zl+V8QB9FA8uEphX4X8
	4f6cD3nl5xEiAgE9JdThvvTt9GoqoyTskfjEhjX6s/W5aiQ/642SJvzytVwJQgrSQaPQ50zuI0o
	jLmGZZhZopYGvJsEYNlZ6gWtDezoSyIFRuxbfYUMx4ZNQx3BAL8tseOS6T5bbVzUp/lHFU6mvTX
	1b5sKl/F301csIvcL9NbJvfC/YpcMUs/bBAz3lC84ToMptIH3xhxYIZyOwa6V5fBPtiTBnvPRFT
	b4eDDa3QW8n4tQ7vSCvv4YWwq+Av7S521l2Ij6KVswVDHGKOaHODGOhn0ova8bQLZhhr7cNE7+Q
	ssCifBYb1qaFVgM7m26/ml/v8inavGZZoZLzg0pSfJHOLiJjfedYAS322XcltMoVRcPxyvlro+/
	s/GwCF7Pc7q7+sDqPImhDeFHzopCfEnYcm753sxO5oonuVGpYgHeDrdWrgFhzyxPLeNiFZdaqSF
	8edym20L6yeQRUmu+IC+WKTgi7ae3NLMuXN32iQ8W8FCn3axiBrq6NJ0ivK0fTQrjSKT99sDD/V
	YAYpDcN6X9MiEUwCiNDHp/uY6MUduG1yZoUe0CVLeg2+hzyxsdOe+simR4vu3EB+yShKng==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr33877729eec.23.1795759992402;
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 05/11] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Fri, 27 Nov 2026 14:11:35 +0800
Message-ID: <20261127061147.506129-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

