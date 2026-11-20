Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164185;
	b=gc/i194s2I9t0hPcx3B/X+52psZlRu6l5jUKlcfI2aYED2iky8qfU5M5aaTnVv0zGEUq
	 CtT1fj3budu38NpCKYiOPfUMrCjjmfHCqLBohcODngkY1gjhyo7zsbeUrmKKTOvD0MCy8
	 0ZGmwTG4TrxaFZU6DlEHwG6OTeAXuV/MDNC0A6q+1k9DPxpWFedzTTyrBkxfVju9T5aNm
	 MBvuH4LpjlB/V3dG3GxEzlLoRBznnyGkeQpMm0lZeOFC16fNCR9wd+ZEKlQ3lA3MbcQrx
	 IuQdU72aWBDTrRFKAxOIHMWjUnAsxAZPsSCgALQO1oCC6tpuO5BDrouAJEwlxnC9IHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
	b=3f7AiVRyLENIxVtwpn0032/qWe0IUlaQZj6vP/TrQJ0xDa3DMCyNsgZBUjgqvL/kZ8Og
	 O/3XrirNmFM0KvbK+qtyNHl48uIOLR64l2lyWbOplIH5GLtt4Jq5ZSasfFsA2hlTxbuEr
	 +4PnOneE7vq0/5HSO2toGijzZcvze7CVhblcADI9Z6V3Rb6YiPqC2P4vo4pDsLBP0hX8y
	 TT+qKhQTjbf8mG+IElHurNTkFLshgpQBT50ZHBRv9UPWlEJJdlCwC/nO/ORSg1fIr7Id+
	 hQL7OfVBk46J+nV0q54kH1VptXjhnfcF5Oi5fU2NXLWEEF8tNM+6mHnNGA3Wd9VZ+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue88hfMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3CVA0Hx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B960A5BCB
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57B960A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue88hfMy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3CVA0Hx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewjX3575749
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=; b=Ue88hfMyeyknN/Na
	PMcVAuY6z/eVD7hdpBhtiSFXvWLmepbDDK+2kluueZs0ldsuAjGKKgajgMcAPnN5
	3GGCg6zrsh5VtnNUkzyyRIvg/w7Amzf8lc88YURAHkAcaALBqasggJHJRE43FbnI
	aCThIZHTcmUaCgFICApibpQ9UbUh8BLGTdrzaRwoBict1bPlD6H1iggg72y62N2W
	f2qdpEjeAbvqPD6IazEjLZG22RjKyJ88fMk9N+5oqFacHd4/57oXw2SDB5oocdlp
	9lqH2y3j9DbklWN23u7WEqXW4eOqlCEG9d4ybGISgSaxfLSAznabbJDBMX5cwLMj
	CFrPqw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383165e9b0fso707488eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164183; x=1795768983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=I3CVA0HxGwLqEj2qUvidHrobjDWkjLSAXHXdFIzOqh+kffUFcN4bVSPaHC2o3mjGKN
         /CTjKCOUXGfO12M4Hi89+8ilu/GGIepnFM4fY0X5G4ltVFw3b/Yv4qdyTL1klTwsMFcI
         FsJI0Cs0qypAzWxufv+oHI2c555d2erFIaw5GMoOAJWc0t5hb+AaGL9oRND9LCp5H+UV
         tM9SibNlY3nRjpjraVNSB8YBKrRsEuWwICifmjosREX+imGfqRhotUmpYw+WCDDnMhNl
         VG2nge8nsXMIl3WkBwYZOyk8rk+TacKh7qiAplif5de90hhFKlPYaNfRs//gg+49oRZY
         fIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164183; x=1795768983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=ShQ/U3urYZQ04PbuerTmp9KIWwZNUnYdscYM2OpHpA4tlsxqEyaCIYNF4HGZHY5XJ0
         2fa05j02Gzb7QgPJHcDQFHywZW2o4kEHDUs7PoePom5Dm/k7LCLFZvBd85HZ3zoVAJEu
         hkA0noExC2dy9J/vAOY9sbhGW9bNY+LF4J9sfLwl51TqE/uTfgVB4zIZeFKMX9uMiZ7d
         GFvklekPML6981sLFAtA3IcDYNknu8V+9eNJH60nBCj8GEFm1iwUByqzbK2xwwW0dKyO
         Mu4BkX0DPP9A8ASK13/ONRPngPc50AG+Or6uYFNSaChP8TetISTTnh7UNu2DyPAyM/u8
         akww==
X-Forwarded-Encrypted: i=1; AL+hErF6dkE4q17nuKnF73+k8F+ZVclrqKL03tzsDef+Ut3NLhpWaJgQRUMv9ZIEVOhTZibcBKSTZCm45gnFFuCRDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7fHu8WkaByHcNxg76hjArf9ObKS16ReKdJlkQLq3gPfNFVTX4
	zLd0f4Yrj4DAg0t9UD+2YhtIbjDMNEYslJc1ido2Y3E2DUfsfHFRClvFo3MwH9Yr/0hC4PwqHax
	d3Mpm6y1k56um+HE5x/ClGNFStjmZHHnmuFN9l2cOMblQ/YflXaDBUAL7KlZY9bwT64FjAQ==
X-Gm-Gg: AZFdTZevwMLB/u+foJDWZjn7U1tBSgQxxCVcr2rgs9yGPbDsl6deYKbwd9ag+AdntrN
	Cv/Jl5Du1xcORh19AqzZHypeqQJ6MO2TifztghuS8PfDeF0OP85SeCKi2qTtqvdMHC0rGmkhWtL
	tZ/eIVPMZ2ftMB8aCBdP9onJy3WU1MWrQgsWd9WyWV0jWAzpLDlKzkHaAgAbwNXIM4esbIoSQU5
	TInswADuuQo+DLX1NU+24W3tM/Ugzx1FB96M8K1X/i949oa4ExVzSu6rTb0QQnRSq7T4rQZdxkb
	sRlAB5EfyK6F0DotDV9BtBNYKGotFbb+zB5vXYCfP+QDdjiQpd6KPRDUhBJi4ug2UvqT84I2Non
	R0m29Os16PTeqkuupI9qtJ3UMbNAvBofpwTZNBo+vLnKE8+vCGH8Z1Y0CshKwU3W+z8EddSQsDv
	aeR35Fymh301hc8je3iM6PvbA=
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356575eec.14.1795164183269;
        Fri, 20 Nov 2026 00:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356546eec.14.1795164182667;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:35 -0800
Subject: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=6759;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=z8KYkGdqkhnSqr83Tg566e7vp6z6Rom1upSnLJcwUrM=;
 b=gRtoor9TRTWzrmnfB+uBtwKOMsYIpI2xFukls4ziPH6sEoB1Cyv/Kv7iUvqOJ55edvYom3YHg
 57/Zei/6pebAGLqX5ZFa7jcPsdfxRT9g1DRfIzCNH6PkeL4IC3bK9nL
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX/TKEnTfYPn+Z
 Vuo5+j8rpBQKinoKoQRqvpnxu2tut85PNmcJZzowttA/Yf3MJkiLICyelZFX0UcYJRvFuuc4n2b
 TYjz5jT+VcN1kdvq1wNrqLuWqjsHpbAJwuDJQ93XL6Y+zMYXc5gzXY1WtgNuXLxdMMQn6B5bZh4
 dZuBFO3AbTW5KMnciVrkbVOouq/aAnN2pSegXIFxbDMVAOVvwCiyzDToHqNwYqPJKa0DvgAFgnp
 Le+0upqOAC8a5ISEdhsFjdlhochyhp5Vk0WoEkJQnQ5cWlVm7uEYYp0n9cFqP3H6XJCS1Q2QU8h
 n95eb+oe38j8L57vH750vgQlMc5XBgUZ2cPnE7wZYJzVMD0ikKt4n9cle55cCXmZ5hUy1UWlhhp
 4bGOwGJeJJ5+XBom449tKJChAokERzGtJBr/MltND0KxzKAb9kk+BhLES6MDnU0EIdOhxMerjzw
 2kRmXrzxWcCtDSMBY1w==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000818 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fr4EAzCGZu4FAUfOKUQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: H9jwZYBP0gtbf3mtriMF6DyRqoSrDOjT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6SFRxLGRYGv3
 YEHGFFX4ZyaMNunofRQ1jsGRo3NJPgjv5aVtP81RcipJnTTfLh4xBO1SESsh/AaSciDw0PSfgqM
 3hWSZ4zmeR2mlX2ZwtrSh1Pv+pZRrqA=
X-Proofpoint-GUID: H9jwZYBP0gtbf3mtriMF6DyRqoSrDOjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
schedules wr_async_work. The SDIO sleep timer also schedules this
work, and the work may re-arm the timer.

The current shutdown sequence does not prevent this activity from
surviving an SDIO power cycle:

  - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
    still be queued before the card is marked disabled.

  - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
    cancel wr_async_work.

  - ath10k_sdio_hif_power_up() does not clear work or requests left
    from the previous power cycle.

As a result, stale work may access the SDIO bus while the device is
being reinitialized in BMI mode, causing errors such as:

      failed to read from address 0x868: -110
      failed to read fifo/chip control register: -110
      bmi communication timeout
      could not write board data (-110)

Mark the card disabled before power-down begins so new asynchronous
transfers are rejected. Make wr_async_work drop requests that raced
with the state change instead of accessing the bus.

Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
during both power-down and power-up so no request from an earlier
power cycle can run during BMI initialization. Factor the queue
cleanup into a helper shared with ath10k_sdio_hif_stop().

A dropped request is completed the same way as a written one, only
without the bus access. HTC messages go through
ath10k_htc_notify_tx_completion(), which lets the endpoint release the
skb. The IRQ disable request signals its completion and leaves the skb
to the waiter, which frees it. Every bus request is returned to the
free pool, so nothing is leaked.

As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
non-HTC request itself. The IRQ disable request is the only such
request, and its skb is owned by its waiter.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fdf19ce4b55b..f0e1feacb629 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
 }
 
+/* Drop any requests still queued on wr_asyncq without touching the bus.
+ * Caller must ensure wr_async_work is not running concurrently.
+ */
+static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_bus_request *req, *tmp_req;
+
+	spin_lock_bh(&ar_sdio->wr_async_lock);
+
+	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
+		struct ath10k_htc_ep *ep;
+
+		list_del(&req->list);
+
+		if (req->htc_msg) {
+			ep = &ar->htc.endpoint[req->eid];
+			ath10k_htc_notify_tx_completion(ep, req->skb);
+		} else if (req->comp) {
+			complete(req->comp);
+		}
+		ath10k_sdio_free_bus_req(ar, req);
+	}
+
+	spin_unlock_bh(&ar_sdio->wr_async_lock);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
@@ -1469,6 +1496,15 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
+	/* The card is powered down; drop pending requests instead of
+	 * touching the bus. Prevents stale writes from racing with a
+	 * concurrent BMI power-up on the next recovery cycle.
+	 */
+	if (ar_sdio->is_disabled) {
+		ath10k_sdio_drop_wr_async_reqs(ar);
+		return;
+	}
+
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
@@ -1586,6 +1622,13 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 	if (!ar_sdio->is_disabled)
 		return 0;
 
+	/* Flush any sleep timer or async work left over from the previous
+	 * cycle so they cannot fire during BMI and poke the bus.
+	 */
+	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
 	ret = ath10k_sdio_config(ar);
@@ -1629,7 +1672,16 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	/* Reject new async writes from ath10k_sdio_hif_tx_sg() and make
+	 * ath10k_sdio_write_async_work() drop any already-queued
+	 * requests before they touch the bus.
+	 */
+	ar_sdio->is_disabled = true;
+
 	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_sdio_set_mbox_sleep(ar, true);
 
 	/* Disable the card */
@@ -1647,8 +1699,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
 	sdio_release_host(ar_sdio->func);
-
-	ar_sdio->is_disabled = true;
 }
 
 static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -1659,6 +1709,9 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct sk_buff *skb;
 	int ret, i;
 
+	if (ar_sdio->is_disabled)
+		return -ESHUTDOWN;
+
 	eid = pipe_id_to_eid(pipe_id);
 
 	for (i = 0; i < n_items; i++) {
@@ -1972,7 +2025,6 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 static void ath10k_sdio_hif_stop(struct ath10k *ar)
 {
-	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb;
 
@@ -1984,25 +2036,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 		dev_kfree_skb_any(skb);
 
 	cancel_work_sync(&ar_sdio->wr_async_work);
-
-	spin_lock_bh(&ar_sdio->wr_async_lock);
-
-	/* Free all bus requests that have not been handled */
-	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
-		struct ath10k_htc_ep *ep;
-
-		list_del(&req->list);
-
-		if (req->htc_msg) {
-			ep = &ar->htc.endpoint[req->eid];
-			ath10k_htc_notify_tx_completion(ep, req->skb);
-		} else if (req->skb) {
-			kfree_skb(req->skb);
-		}
-		ath10k_sdio_free_bus_req(ar, req);
-	}
-
-	spin_unlock_bh(&ar_sdio->wr_async_lock);
+	ath10k_sdio_drop_wr_async_reqs(ar);
 
 	ath10k_core_napi_sync_disable(ar);
 }

-- 
2.34.1

