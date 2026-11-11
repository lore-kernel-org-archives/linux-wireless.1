Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384397;
	b=R1vORByQDg9AOULs6gurLirW7/1+53NT/+oITYMc9ryEyVrsB4M2V6d6Ej/hdIHIURDL
	 5tpJlzJqCN7Yig+uf/tF5Q177wPGMflNoPRc77fCdevb1UYKizCZ9Kzk0tgau56Aq4u5A
	 SM7MpnT03Anu91pTgIDVc4SuO0tWYKqYuIBtXyWvhxc0mcPxvpq+PIsF5CRrURlLPU9EZ
	 xAjJIobjI/kVsL/cfwUdTDX4vWUNcl/g/QneO8MRNL/uGt0q3hXF1JQ187xVYbRDld45+
	 c8k85UeOHINPG4KholycX6DfJDeVPn0BD0lXRsWajr9jkxJ16RbVEhcoxc2Z91TiojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
	b=ik5nLTXGkZu5qHTEjsFU2b9KhHsvnreK5BAXEqv8cYNNarTNK/BN7hcHAy1cVp6P65o4
	 zdR3iJmTcq3EHYRDFvaMuT7IWgByQzyQg+48mV2h8kSgpz/8ODVQ9NTrymAzf54DiuwK3
	 PL+49gbnlXCIgsgGwHyaYALNIw8/w4xnm6n4ULwyUgns7IQV8DGQMIzgP4Tz1KAJuco9t
	 hHvQ6fnsMbYwiwcR2psTZ8y7/uoAvfairRY4ao3XcAtATRbLqiczkVLz0r/LEz0DHpzIg
	 tHSskrwnGyoifab+vMPnL+H1UFPYZbezJDH8Z7aoyYjhj1C3JRiZYlb799Ve2Spud3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08660A6F4A
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B08660A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c504bfd7393so246378966b.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384395; x=1794989195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=G9XYGNiZqL7cP7CR4fV/TQ3pohy/Mat/Y9YA8/O2Z8asWXdeIX3vT7ODOi6hC2FWMW
         pIeaTOcKTAFnUcfKMb3vNASe8zwXsdnpMrAfvroi74/OAgUpnbDspnE0gMnnPhtGL5Rv
         9JvTMJSsmfka7eHEjfqwsir2jxglkoL6LaNkqoS+tMuC3dupzZvpLpg8lbz2WP+dMgts
         q8RZUdfOJh34+AGFdIsC49BreKaYo/VYt7r4kiaSP/wP9ObAu0fe1HuQcjqFVjA4KJRZ
         DWsob8vj+S9jQvoiDFBmVmHFvd7TYqgX/hmMpr39ksaHwy+nTOFtzrrQ0mOvQ0mFYUhB
         zPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384395; x=1794989195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=ciBkcOo54oKk9RFyLdkkzz5VShrGmJXVSroMwqomVNcGZMnZ9Dyx92BXYf3Spycpqu
         T/Xil7IrXXf977o2e1O8NKQCHoVKUaYPen123sIBvUux1KGEB7wNLcDQciWGirUD96AF
         qibiv0jvBpfP7/Ey4ThX44Q84ysYuGEFHhXdu2+bs/SCezayqM9bVPwQKerQ0nyG92jV
         zFzOg9pAeQ1jC5X5Nik1kho8NlgQkBJBbimM/Twn4q0YcRcd6+WxEi8YPAZgLsQQGcHS
         nGJFAoVeYurqlmq6ZATWrp8u0LosCwyzrobREmHu6l/VCRQ2b5o9XBffQ1Zigaknic8p
         4E7g==
X-Forwarded-Encrypted: i=1; AL+hErFv/IG1dO6lmwMjFwDqElc08OX4qUkQzyZGFrcWcwbcj70rBCKY4WtHkSl9LYyuTlOxRp5bKjUFSOUrc0DCeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jQfT/L/YRmlNEY44oggAVtQAbnM0cLz7bMGU/4O9VDMQE5XB
	Zi+Nu+2wi7cGZOWS0qO/exViM81HUhmXgDLCcoAGt9IEOuZE3pF9VUNwjwJG93FYhg==
X-Gm-Gg: AYBFou3M484N6aqEUlgfAEJlsxA+YVatDv4ISzZIA4+8l7Fa0hFRmWxSKnHdrGhPnJF
	PV7IP+7KnQh0WfLANokxMre71lmxgAxFpWUDrIdykXzstVScUTCrCNDTFCGznn+0Kifq+D/nBfq
	LaFP1Hcf+k5EsOC6C/OC7zOVeypFW0P1vmLOVQl6AEGns/66KnH97mwm387wjbuCOrYyJOV5eyn
	zL9lCGioJB+VFnAznDNZivw0qnJnuFMiFdCIqFHVg00dzJTUWerY8N8VXcvuRAWfQRh0XSM04aC
	6rB+c4IcIHepXQfoY5dEvmme2zr+ek7Unh9MvaiyX18YRS13aqmSQtWLt5ns+sCBLeNYoRDQCOK
	mV6iDUoVqHGTMlzyEI1xghIt3Gj6dW1lm4wUDx/qlTqTs5sRQ15lnImNjTgRhrKZLZAHk5qu8cx
	9Nf5/Z32mdDNnvC36RvR1chZzWDWPvBIDPQWxKyGhHlStvyKi0B8z842IGA5svFIGm0HeoQjzkl
	Bep84wQxj8HNiYfdc7zy7NH3srjkECOSMsKKE40LwMRMI+sG7WcrD9SALnICzPQqlxcNjxte3ay
	Ua6ekP54hLUfC0O0wgIX23DLLlfTCXnxuCiR4u4/CAWHpeb512EoesQYyyr5ITiNBXH9ZdRxBaA
	DmvX7Iw01bTGJz5tVxvYkcYb3BOOZtpL8qXaudIV49A7nRERxivcNJpLxHvDhfRlkiXscnIuYcs
	nMmaJ+wBnEP/NRnQmcpjmdE280sXKaokrdldhCKjpEHqbZiYVAA7KmYbVebjN+S1hU1U3Qm5g0D
	jwD7EP88Pj8KRVhhvWRV7gruSBq3+oamnRMfQg6sV1t664DavpbsHmZAmZfygP5qeo5ceGuhq0m
	w3Q12V41o7/YcEaaXlw=
X-Received: by 2002:a17:907:3d0e:b0:c49:d1c5:431a with SMTP id a640c23a62f3a-c5066d58e34mr133683366b.38.1794384395369;
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] wifi: ath11k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:29 +0100
Message-ID: <20261111080630.244427-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
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

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath11k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..c4e4b9c5ec0da 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3172,6 +3172,10 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0

