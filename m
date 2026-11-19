Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048147;
	b=lIEi6Mqj3HKDlXKu6UggaO+yQFoG24H/D+QvxknR8C5O6t+MeBodsB7zVxXa1NCgXkNF
	 pT4zXA9ZyO8K7KDqsHI+oF7lE+UEoDKTJZ2tMmMZR1OlKFPhZctMMFspxURnVA61X7Vld
	 bD3SBp6pzQZs+Ri+tNvVoleKKaUX3VN2lveHEnVhYYeYxUIStby5Ee0vF77kU+5N9enX+
	 e+x40rTboTezveWG1M85l2mx0kcX6yyAZIBWvz0juI0o1RT8GJFV5DeyVDGa/b5pWyBdp
	 OFfYBVYZMEstLkcQ6Fh8Qg0Wq4a2HoYh1aroqoFx+um8hB88pmMA0pZ9LfH6KrrDazw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
	b=zCki/ziM8VDMhORC5SmQdGgyB6ymF7LqTlMPYOZExqwPipJ6KhsY+fGImul3wcGr57qV
	 JcjfOQ+2tgQfWex2X3uObrRul71sxyxAbW3m3Jb9juijml1M0p5B/PCznm2bJElPPwwNR
	 RLLRAnndHyf/NNWIyxjcqRmZNksuMyVrPAKNLHDnmJ2kHao+TIGpquviSxTI07DhEsO4Z
	 BtWP7eCONEuO5GmLj0edai++RJw4uDuX+GN+ycrP1HrB6HHD2ZEUvSA0gEpr84TGobAw8
	 6MvvYnaeqmw3KOCxmFIeCsFYUiaYUgNHUSAd05a4PhJ8aunEzH11zTO/C833NhPWMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FcSNu/61";
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA6606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 00:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcSNu/61
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so14878946d6.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048146; x=1795652946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=FcSNu/61jCMNPrOtKUwgp6kZv3gWcLIy2clz/mjA5E5lu3XlY8fYLpyAjxaVgv4tAF
         EwM83UUQK0Mj5NkhAkQmcUx8gqQOK+mx0kEn0A+Fh2PfIgqtd+LzwsXjJCMEjR6ZPue6
         jH3u39YDBP9EXUIx3H/D7MCEdFUKSGMEsNZ2NZ3ygkhJY4sQ6nppfpzSM4H0eavbd1qj
         kM0L4TvWleapXT6HWdWjafWXmx0wABbjqb/c4YMsGnaXqHbKNfVqpJou9hdzfY5gXsv1
         X8OXp4vTQX0ZY1T8zO2+UgGvKL/shaLYI7m+iYzAnUnLY+20yeXSNSbmkWfE3z/IBPfO
         vO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048146; x=1795652946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=aiE79OyZocKlnfpecgclZ7PiYW684hzNh9DE65u99cq6H5QhXwPV2NtPf11U6YgZcd
         Qa2HvzYcrRzELcHW/IWn7e+Yjne8hnKeI42v2HTs9ciPf6OHP6gkXauQ8kEw7EIxEiVt
         FO6xQ8PFVcAXLjN/qQXFH5ohKkeB4PwXmEwvjnOriHNPmQzbO1RxjAm7V2nwRwXX3wGg
         WsoMshsgaOP2xDpbGDc/5Z1GmB4I7DapD5Hngg0C1xVOwbZUz8QMiaDo6NJV+InDkpma
         eU343yWLo4WUJzBgsXq4tsY14fJzT+Q1Ca2sS6+YqQ+UF1+D/EAkUaoJe7+O4M46WG/f
         pKIw==
X-Gm-Message-State: APuU4Z93DiqTUTYiWd5QMB8BIL/vZC/uqDvhZxf0MP+boQq1zTdGPYMX
	6GliNsZys6/VXoTl0/Tjm1pzMMZoZD6y56Gbh3mVifCa89QShWCqVqv0
X-Gm-Gg: AZFdTZdGnbcCPxMJkexkwBkofLXv589PBdkbYuyvDLTddzJY+Z8TQIE/ZJto8oosXoK
	d18pEXcAbyCwNUiSf1ZQQtz1XB0STOBfyOgEIbM0vcY3R368NLV5efxL3pCBIlJKMk0I0cwQ7AT
	gDt41vA1Aej1cLkcftX2P3JOsg/GYkenZg1MJS+FUK1E2UznNZQXDwTym7lt+del3GVUunWb1F5
	bLkAx/OxlthgYQM5lXJr+4Oplu960nWLdn1FRoe6XMUDd9cAxDUC+bR8OXKDWZr2b116ZyM+WaO
	/fiPP1dhBmR5c/nceQgGmgAokzTxOcUhyHgOU+lZbLNvO3lF8mGnYhY1xSXGARGC/lq/XYH2g4w
	TsBsOlMEDqZMxGufj0MY+tRqAi0Sh5qqmNYTKw18laUF+jjP1B4CW7AflnYXKumhh3YHp/s1sCZ
	EElfuhJeg95AKtUx38YGuQapd/IbMHEMJ486NXiATEJXjLSLwKX0QN7zi8v5FWuPFM8QDw++3QE
	VmKJBFlb1cazc1jZmOGmRW4G4EtstohjR3egVi33GCRa9Y4BP0bbduiKSXUV3PCQlYgwUcBEjg8
	NS0y2ohl7V437hkCe3wrev0S0SA48FscLxRrvIZ1I67I2b//RrHrwD1zDBbeeRHjLd3CTqWAObj
	HKRHWoDnHI/7GzrvUGoP3
X-Received: by 2002:a05:6214:460e:b0:91c:8fa6:1789 with SMTP id 6a1803df08f44-92114f8e9b8mr64253386d6.28.1795048146119;
        Wed, 18 Nov 2026 16:29:06 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:05 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 1/2] wifi: ath10k: free msdu_id when HL TX fails
Date: Wed, 18 Nov 2026 19:28:57 -0500
Message-ID: <20261119002858.425666-2-lcy8047@gmail.com>
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

Free the msdu_id if ath10k_htc_send_hl() fails. Repeated failures can
otherwise exhaust the IDs and block further data transmissions.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..298e6a092101 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,11 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res && ar->bus_param.hl_msdu_ids) {
+		spin_lock_bh(&htt->tx_lock);
+		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+		spin_unlock_bh(&htt->tx_lock);
+	}
 
 out:
 	return res;
-- 
2.43.0

