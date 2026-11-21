Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302475;
	b=254g0UFy1iUbvsmyM+LYLDXsE4bPANzP+z+AR6iKjQZX93BZCtbA0Owu4QTA3c6aChjT
	 bDpI/LiGWDLqefH1/9XXa/nepyxVLp1wr3ZBvkMSgYDT7fCbWYUELqnnHslgIJgOkTlRf
	 70BN9SVgY8xIVaQgZFeZhkjl2k09omdAqjfnJJ5KKMm5Kl4LCyIIJMx1WbY8sETJxGGPr
	 mOS/otwYm30llJJ7sgztJhUqDLtQ3Dptm97NO1Z5/VHQ+uIb6eNymRSGVavX2TzFiAJ5Q
	 DR+dtN6bEtlRO9y+fFIVRDX/PyIt0Oxcr8dJUlvouOFdiNOpbdoQO0xI5os3pR0pMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
	b=x5fSnd37vBfpZ27jIF9IaGMHYSXYwTdAvXQViaH9SZ2Ibc9pqj5OPIcluxyVrvEMxAkE
	 o8RwegaP+BJznL2BneZnM6IUyXrLguCPhYy6HZ/6Fh3xcbPaKmBWA7shpbFJ/voVI9N3X
	 EEZ0h6q68MPIDX+Vz+fHDbX2WsGBM4kB8YCXRdJhoXRVf+ePU/bSPZgUlkZzmPYjOTdEN
	 /RAxF/Elj8Sg4bSpqU/jzOV9LCMoM7zgV5ONFkKg2iQZvFhK5MPRd6t2NDS70XgiCtG5J
	 JUj/7BjN85NbhVELLYYXwqjVg1b2uBMkqNMKt/A7kap4D+ySo1Jwn4JSCROv+5jDpwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UXsXM8VU;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F94360A3832
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F94360A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UXsXM8VU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so337990866b.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302474; x=1795907274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=UXsXM8VUxKGW99RINHuFf7j8UKpu+ylu5fmYvOWf8Api27Hx8/jxc3tK0a268TsKTv
         62N3C6BGhJBREMSW5Mc22tx58eaeWDD6YJc+e/iO/u1SoGqF0825XqGBOIirAyCPZssB
         JxgxQfdB+0gReyZkQmPM6oY+XLU8Pr3iIpGfKxdgaKWnTkGHUI2MZabNGFQCgDK83Ovx
         1cAMenaxZaMx45dQ9xGQ+3XTHk/bUo+onKlscg0oV7jE0PvGo4HBPAGCfXwMLTjsWnYv
         tVP1CAQqwNT1afmJXpXQXJTcyr1jLVh6nI+zLUdgmXXU9uZ2cOfGBcUADaj71SZt9xb2
         w9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302474; x=1795907274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=d7PbNAAiB2z7qDfTwVGwYJu0Jovz/FOhACwHWu8ZDNArfVwSidvwzRHhEt4NreqhSo
         J5yBXipSU77A4Ec5axZPqQlrGz+1u36Xo5j7ZDRn0bwC9CT8AaN5WL7ZE3XRwEjItYLM
         ZH0TwKdpekzY+RtIBV4EYxs4PBTk5IRuQkqaSaPCF8UmpiQ51SMcjLGW365O2zep+v1K
         5CVWMkKU2STvryDKacBYM9a0cXfw6Mv7d93eETXMnZQGQUJDp4lb8zpCCzgRM5ujo9FO
         7f9vzG9rBFRcUe6gfQxqYZ68V1u1tyKGqwgdh2BFxlUGIhoZDzdBkmpNIdbcT7Bc4FpG
         bQpA==
X-Forwarded-Encrypted: i=1; AL+hErGwi68O8GFhW4L6uRz36dw72fC/WGXvJndIPzD0LdLzW0b1I78vmJ5V5xB+D9al7xYo4VjqTj38+wjkDvrXzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9T+iDSV9tlPobAlpabtgmkIKIA0uYyhlIdZr5c7+gPqrKryvZm
	IOv8Eof6h6wuU/zi2V90+M2h6mwzXgG9w8JhgBPGbRZBEqNIzBLR1Nr1WzAS4g//7g==
X-Gm-Gg: AZFdTZcpHlcN5gST7RPGiLX4mk4tXU9Lf+l+9FD36ubzSygSQxzHHDTqkirwk1RxrZo
	Fvkf4VXH05UsIbYwLqw/qdUGrTq8XvKnzR67ww3Pv11r6AAgc6wYEJAN36mHNJmj9qSRYaYxPpI
	JAcNQmcwIDa0T6iS0nCt7aIapKVej8iH2DPWm+yG+mlUJUufX0/qAA8Z6hWyt8HWyk/l0OeVuUE
	B1Tl6JVi+aWwgwtQ6tFoXBfXDi+Svp8X+1kkGfsy2tFqkUDI6lFk6Q9ofyIYnPohnfwnGwCIFtc
	JBfMBD07elybIsJIpg668Cg5gFUXGVb9x7S1ML44a98ikCW2S/9cxbBaphPMYkW6+WB7/QO5uUq
	AS8+u4mvD6XEbkYfjDo8KGNAPN4I4fta5HqoxGASr7bc/ME0qKI6KG11lWTsvlHTdHY2HeEuKMO
	6wIMHHuyAsCmHOvhrh2A2RK/mVGuOoow4lPl/lanK+lz8ONndUZ5rwVvZF81SazZG39R7sUsn/q
	eGizgF+TzdvRvYBNH7vC5yVy66sBOB0Trk89M3Eq20X/aFWZkhfALmFp4EB1+ybYVi/T65OfOOR
	yFyQqMNJN4k5KLKUyi4q7m4SBFJZNS1wYm29IjGfYawBTiAmr0bCXUrxajzBGS+YBGTJdhxv51j
	MH+U/nTvhAXTxeIXY5gEO61zI+RYY+X/+6m8BnwjpTncgi1ZJYEnVzSROk+8Q0rB1HgexzOdA7N
	k1U+rFLijc7jD4/k1bFGUqTBR+8lrT1NDBbRXgZ0N5JUHHrbORKj6icIJBnqpUY0ahUQFKeW4yj
	XJfvMCg3MNYkWie6VjCccameewd9iLoV/XXOFrW+DL+T+/WqS3JXWOtlQKl83E7iMg+iBQvCSdF
	gfB7vjJ3wu7B0R/8FcT5SYvejKY5CH8H4oy+VJCwhOyij/Txe1Cng7sLKWxr7H+AtW5AaA+DG5k
	=
X-Received: by 2002:a17:906:f5a9:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c513aadb0femr716344166b.44.1795302473838;
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 11/13] wifi: ath11k: free the queued QMI events when the QMI service is torn down
Date: Sun, 22 Nov 2026 00:07:29 +0100
Message-ID: <20261121230731.1206043-12-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_qmi_deinit_service() releases the QMI handle, cancels the event
work and destroys its workqueue, but frees no event still on
qmi->event_list. Releasing the handle reports the exit of every server
it knew, so ath11k_qmi_ops_del_server() queues a SERVER_EXIT event there
on every removal with a known server, and the event work stops early
once ATH11K_FLAG_UNREGISTERING is set and leaves the rest of the list.
These events are leaked.

Free the events left on the list once the handle is released and the
work is cancelled, when nothing can add or take one any more.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3ce7c4e5c51c..4a3837958e01 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3361,9 +3361,18 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 
 void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 {
+	struct ath11k_qmi_driver_event *event, *tmp;
+
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
+
+	/* The handle is released and the work gone: free what is left */
+	list_for_each_entry_safe(event, tmp, &ab->qmi.event_list, list) {
+		list_del(&event->list);
+		kfree(event);
+	}
+
 	ath11k_qmi_m3_free(ab);
 	ath11k_qmi_free_target_mem_chunk(ab);
 }
-- 
2.53.0

