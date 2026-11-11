Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384396;
	b=u4a7D+npSI0jxqQ0snBterYMjMLA7nTx+TQaX7VV8F2a/N+IWsyBfZVAi1RaH8IaK9/Y
	 HL8xPvwD7ZLUAC5p0K6eoiMqlUrdepoh8Y3aOjlx6rd/CGEysPOqK3WBH5zrDdqd5oGe5
	 lyaTAYzudaflubiqXI/rhK9ydIUuoJYErkvZATRQ+E8c1D0LdVtcDD/kxu5FQ9ISWxGKH
	 lTrX5KyXxFCxG6HP6gDXxOBdSY2WCbPPV+VcdKFiWTUYdyXEoZ93iHtRORz7IHwSgwlN+
	 5dQc4GfXBQM6NXigAURSAba/WxYB2ZNYEfTLldVQ9mPdJ/2JCOXWEZV1I7U/aEQFcOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
	b=tVxZz8QlGGLcDhfAdUJkUyMy4paRxdaOXyj0sks3PIYJ7cU0nZC284z1OYHCKpvEcG4G
	 nHaac1NY6tY+NKYVAo/wpU4EqGWfAUq4gGcicUqDheZROMkgRLd7zJznsg5xkhL3az8Yv
	 gMcRsFfP/TcgN6b63IYmmM5+cUCdtPpnqniFX09XrUeSLV5YH7uGBAbA1q7nWJIlUU9w+
	 0CeVsSHd3ezFYNdq/sg+E+ovNYJZhTqraHWAO5j3QVByhDFm6N6tHPRcWpjCEwOxzmyhP
	 rudUs/UJzbDVKx+Uc3DIgZ2owplovFBAtZzoaEK0zebm72V11BUhn8Cfh2gDAKSeBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91560A5BE1
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D91560A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so450394766b.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384394; x=1794989194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=ahFmw8U0eeZvB6yv9lj/iRJo5flheWQupjk/oaf61Ec1dYOWMBk7CYVknnuBSe6KHs
         Q2aptZKfu2hDpSIqF/N3nu3smoEDel3zL/U6Zun6n5RxqvTTwmrIfpS4W63fmJK1hSUV
         ++6Iw4YuQn0dId1loASC2FBFFWhqATo09WL8qMb4Jn2Vx1vknwKS6Tf2onUn1a1lnCXu
         yUoN5nhZx9LNpant22fZNKo8jyb41eLQ9UCmyOEkdQPBcW1cLNI6gSa0LBHVJy2n2dM9
         K49xE1IMlTu4s9mm5PeaczQ61KX9BS3ZxTk4UrYdOMr91+YfUYETZwazyB84E/c8wyid
         Weuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=KyJhDk65xf2Uat6bEQ0TyotadfIQjO+KPOM3v2xLrUtKMk06DaWlxXsXjZ7pLF5BOZ
         jh430ba9D/MNFcrOxMu2mfT5JdrkEknwkmajuRMpXbAkFWWPJrsC/fHWiNfqdhak1ay+
         PKIrCfRe+tSn+WDpP5oJTJxBiFfnWUOtsxn72koMhvcNDu6w0TfVLw+jRBYeHhhwnea2
         e49eIJ4xisIoaVDLKHu8Dryx8bh+T4Ps3gtXngDqZ45b8AgwkosrlRdS2g7WdX+rLqov
         d3icfcH8fgcbvvyDElyx8oYdx71d6nlfbxwn04Wrm+F8nUCUYDTeuWkWq8xdVqy6/QM9
         Hhew==
X-Forwarded-Encrypted: i=1; AL+hErEuSbBWynOk4Q8dwBGr4gUH+9y1X1tM23yywMKN7Oew3LRxZS9yOQkmgp7TKVk7kQa05g3dY4qFIb+6iaAf2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+vyTEn2+rcteWYU92kSJZbsYjHt7uZmGl+vH7Om+wFtji2xog
	Ma0mUqe2kMRMwmfvZwnYrzr2i5pfYpfMvBD1RpTKYudbmrZKKtbhdSK1X+w4OdDuTQ==
X-Gm-Gg: AYBFou1KM4+lk9wechASRdt8IP3SNNFiUGLJOi3Bm7mDzuPrfxM3PpoBgtfyI/8US7N
	QIlNUeceuHGiM+Pcm5dLDhKY2/DYbBFQvuLPJgsnPuTjbeWknBeWVDIWBSt8eKqSAkJ5m/ptPsZ
	DVvR85frGIbfQ8Z70feuE/VwCNA81SDiTXDXASUgkGF1m4AkoyaeHRUGp+L4JwMatX7prddqw9f
	4tjNSvc8jG9ybtGTG6HkhlCzM0OcmY16D2bbqEQNfHY94FXWw+P8s8SKOfe9KtQTB1xDTEb4Fki
	WbYtaK1SNIBjXpGyQZ3ql9gwDKgYg0pdQdrlIqxe/M/XrWid5MvIqArNk1gHT0/ec5UEOwAMPxx
	u8xnGDDPuclx1+lmGsEiIPhYXmxne08FMebIgwTeFpCg+x+Ougs2fVGYiIxe14CwLZBDjDqAGE3
	kzzM/qXl0bJ/3DeR0V2VzohOq+3qdiDuEOcqMm7kuscWqmEHZz87ZMkxmGVKkBkzI3/z22hFizN
	eLMreWMTip/gExmICHnkK0pG7FYiJ9KFP7hUXkTl0Pxy+c+KMfMdlVK2xGrteE9kOCOCA+Bn0AG
	FJvZlN6j2fi6fHulSy1/bKma/j25rnP7wQh6NTU9p7kbVsrrEVc1mlCCq+df9zXWWi5x+hBIyOB
	RxSuEJ7cIdwLbxbBNSdIGZSIYLGGMSpsa+FOZpwYv/65jxhxMAnEhtcXNceImSrHFozSk3SieTl
	1Gdw0GONCf8VVD87+Mpb6MC5pZZOA8N+N1UGT75A+TMmexXfm3rVt+xyXQ7oz6Zx8ALijOPmmd/
	YjqgMpVLur24fkKAXUWqwRUMQMVffkRcSa6obn2k18KG5ws6DL8QfQGZDHpoMAf31odPfVLOkJk
	K6bdtRqF1dZEcJ8jwPs=
X-Received: by 2002:a17:907:1ca6:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c5066b338dbmr122198366b.30.1794384394508;
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
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
Subject: [PATCH 1/3] soc: qcom: qmi: Take responses and indications only from looked-up servers
Date: Wed, 11 Nov 2026 09:06:28 +0100
Message-ID: <20261111080630.244427-2-julius@bairaktaris.de>
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

Any local process can open an AF_QIPCRTR socket and send a datagram to
the port of a kernel QMI client. qrtr_local_enqueue() queues it no
matter which server the client socket is connected to, and
qmi_handle_message() passes responses and indications to the client's
handlers without looking at the sender. The ath11k and ath12k
REQUEST_MEM indication handlers, for one, then free the DMA memory that
the running firmware writes into.

A client handle learns its servers from the lookups it registered, and
qmi_recv_new_server() keeps them in lookup_results. Drop responses and
indications from any other address. Handles without a new_server
callback keep no lookup results and are left as they are.

Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/soc/qcom/qmi_interface.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..ba9d973279145 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -469,6 +469,19 @@ static void qmi_handle_net_reset(struct qmi_handle *qmi)
 		qmi_send_new_server(qmi, svc);
 }
 
+static bool qmi_is_lookup_result(struct qmi_handle *qmi,
+				 struct sockaddr_qrtr *sq)
+{
+	struct qmi_service *svc;
+
+	list_for_each_entry(svc, &qmi->lookup_results, list_node) {
+		if (svc->node == sq->sq_node && svc->port == sq->sq_port)
+			return true;
+	}
+
+	return false;
+}
+
 static void qmi_handle_message(struct qmi_handle *qmi,
 			       struct sockaddr_qrtr *sq,
 			       const void *buf, size_t len)
@@ -485,6 +498,11 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 
 	hdr = buf;
 
+	/* A client takes responses and indications only from its servers */
+	if (qmi->ops.new_server && hdr->type != QMI_REQUEST &&
+	    !qmi_is_lookup_result(qmi, sq))
+		return;
+
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-- 
2.53.0

