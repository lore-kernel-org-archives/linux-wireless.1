Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164182;
	b=xsIMHw2MTbgltvPt1/ewO/znRCKibpCra380QCYl5z1a2KpLqHcY0IZFG7zVzP/37qYz
	 WTMl3Tnw/O+OuSsRzOZptPiQcM4R4m+ZYIPGaA11puVgr8Rxh5w6RQv0QFmOLR53tlz/K
	 iZ/Ye5hPRM9om0njqrXxxKgEGArQQvHyHwwrHygaGYK+hh4SijKUnVf1aXfi4O5DnZzBl
	 jhHTMIbrY0tjaO+7INkPYam150lztA5lQd0M5rUXebQ6Oy3L8b1QGKRAi7m/Xue2MHoLe
	 6HAtTWEfqGuE+OMlp2ViQsJgOvu+WVgot52AOAYLYZhSrhn4FwzqzWn0w6VX2RC3moQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
	b=RkzSk7gtyrX4aUJGOvBGrF/3l0cTqwSNPJB7YrlAsxYeTdd2BsoliiorAAxuxRBPFjB9
	 dY9YIgnvxthtmtjeQ67EG/bJ/Bc65ZyyJBwgrj6wJh04abNiM2/MMiOR7GfMymFiCE0M5
	 WPfGsy500fLlUyrXh64Ucgjwj3dtdNqqg4Zawj2cfEonWy+edxSPzR+jOlfkhiOvS4GBv
	 UDZG+nkmRsBqLESkLM7AkyGDt+E6AzuTCWKsRo+4Fvm9KgPPjGLWs+sJtm9oQfQfwt/wu
	 7ttPPubDNR4zpSsXb7hfIgauIEAZXm174s2PBigG4QECiHaDsYHv+/8tuq/PHw0cErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsHc+4O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jb7ShmyF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201F60A3820
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8201F60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsHc+4O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jb7ShmyF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7es242019478
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=; b=ItsHc+4OZO4Vc/aA
	bT6p3f4oe3j+Yut8OGR+vU425k8/QQhZFXjYhmMmiF2r5bB30HVZANeC9m4ozxSC
	VNHbC61pUeWXo/XrtYrHoaKXbZi03vplTnn3R0FfKlmnpDP37JeD7QHO86vCbr6y
	s3h8uyyBPdW+pka4nNlcC9jv0GeUHA3caKiXmyWuZTuKlgcO8r3NGCKU3QuGboOJ
	hKcvrRNhoqm+Ie0N3WuW03encFH3ajkSqfsRSPCpbFaszMjzp8gj8TsZl8jJe38t
	8HWf3bRTxfpqDQDznhw7m3al/wMEJNM/D5r5xVAdRmUomurlE5wzvB4p5rL7avO+
	d6KPUw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8vp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:01 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso768161c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164181; x=1795768981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=jb7ShmyF58yFVF2fBgXfn+x1Rg+604WbmB79WzgxRhHHuQxXzp7oEwrX8kujoSer3a
         Zdm7zafOpV59AwJb8KFqdBWhOAYRJ3fnScg+0gGSsF0WqBOrKzUxe/vq24wwG9SMgFC/
         7d1Ny5/NiO1H0vhpSpFVm4GLR/dAT5FlMrbJD/6szhM3pa19XvjVlLw6ws4JJsdQXGlo
         /VZyppkVDT6N/ExzRe/x5V7b4AdRcrYIjXo3aksj9LM8bT19/nRr4L8BYjwL1jCmvZoT
         DLI9XJKVx0GYZ4It9Q+A7ewsky15MtvbjZO1W+HodROFol3pK0QJ3ReYa1f+kZVYBV7+
         V+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164181; x=1795768981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=mmQrdq/g70u6xwy43KHqlcnhYmku8G4k7zk6bgFMlWIm24A2k2Iji2PwW2yUvcRPRO
         FlvqTG/hyQkW7pCCSouHcxlmtLpmXbdppomVlHMfA83jMl8G41xd6RTZMjEzS+Hz7OoT
         MQn3NRe3nkh1dqeiHDO0MVwRInQVNAjRKLVwrVJIxF2kMbjPqDKOO5AKZxC9l1hglwJz
         be02QePV+679dXSU2N+Tp6n0RQ0LoXFpcoZ3VxwqW+u9Zk1bBqDPxHLdZ7sTdvUjGz74
         rKRiltVPpTt27Lysf5qaPxpTNjCb2UK/KK3kfi5JABcY6YAKOrDQQsXcHsekwpVhHbxk
         sjTQ==
X-Forwarded-Encrypted: i=1; AL+hErGp7bp7pKiAWaqkdjk/FTqxVM+YnH/5CxHiPPSsWJKgCGC3SohXOpRpIvjmFI8N2Pxjh4gHhTGFrwC94sR4mA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/50iF3xUYyFJ+E8XddtvHkIPH9ccgY8l8SoqPxwTwDidzpoOKO
	9a004vpSojr7apFbaLrW9CnjLuXwTDau1rafzsmAQFUYPQ+A7eE09+Ds5Fj1CsDxvsrdmDo2SlF
	mFQOe3tudbCZ8tQ/Uiisnp3IywY0Q2mDHDdNSud03h5WOTJhCN0jQTqcwQ+aSgcNhxPvcHg==
X-Gm-Gg: AYBFou3kK8opL7UnoSVADJucniU+TzjxBd7sH5oH2crGJpf4G7YqJhUvy1guOZOA0Oh
	bNrNlDw/ObHINT4C19g8n5kNT6B4OQdnbzrYlH4/d8NAzc7jX03gDoP9KyuCcDKnHXEkA1ycqZI
	t1XyTCCM04v0mkJhY68vGFKFJGOUC9uranyyVcdehoL1UNQSMKsrNF9v3vGH3ynlDbLcLjmOSoZ
	lTixe8IB41ikl6XTdj0VEawmSvys7kE4FfEzBBM3/w0JQ0MdtWuCc3MIzki71lVHlsoP/SJbD+w
	giMPFcSF41fCeEW1kPc4kVhR0IW213dBF8KMpr1Yd2Lmg1ksMBZjLrYHmyJAQGDMvlKEFwoW1PV
	jmnvk453uCXraqmzthZqTddYdIEsk5fQ+kX7Em1LPNk8YGn5V6UngOm4CfK4LZeaqaC6R+5gVV0
	/wWnXFid0Qyhcl4PVPwcPcfPI=
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898706c88.11.1795164181084;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898680c88.11.1795164180537;
        Fri, 20 Nov 2026 00:43:00 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:33 -0800
Subject: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
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
Message-Id: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=2640;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=JNWAJxwzcrnus/v8+vUlNw82d/v9JsIYdbkw7ZHl8Ms=;
 b=TljHYvJ8OgaTx4ZE7NZKHFpI/Q3Tg+zCoWfHBI6jepsjPn0wejHld5oa77qQzKUEBVkGG1i5E
 9FrviT3dU5ZCpT1TWemoC/YJRq6EJ4MTJWFeiBlVa1iB5C3K/N3DTK6
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b000815 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX4y37CI133aVx
 zfCDqSx4y+GgammOvW8LiPBsqpcWbjtyBBazhKpVIWiOmwVhaodJlCQ+YG1uSB+rOy1B66CLCIn
 xvt0qtLPFWYXqEHuq8DkRYv2LuZ1O7o=
X-Proofpoint-ORIG-GUID: Y6pf841pjUgTLMOU1zOFpqko-my0nB3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7AvhKEzKR203
 2aAAoozvg547e+UgbJ6ZMkG5+en8aHGzlEZXDVr/FgdYV0cgO2qquVOOqJtIck7wt7A2hDV4wTA
 lz9Yax0GmAyUT3zVTYTKskrzhuzdNppk5aWb4G6slLBEFZMEwIVt1uMZb5eAruGrxObhjtWgEuZ
 rk4FfWLTsmBacfyPcMh69YDnJHKt6eB3Tf2hMQK2sIF9KNmbywD3tmhjrURFDRfuRlfHcbA5ZLV
 IkLzspZYw3uDliLpm4IXL/LrHT9x2/NsTcUMtzu88wUt1kysP3KBcYq4kGbem4u5RQkoG/aAKVJ
 T4rwSAXk8AKSjBpN6yg9aM6e9RP/AkKALNaEIDTklVsK2d+xbBSX89C5/asKgDpC3QLe5B8vJUn
 EgXvh8rRmAcAaGXWnpwhDatU7zPa8n+40EaIjpuVLTZxHECzWckGpJto9J/dXzcIfgGjdAbp78K
 IbL4MVNpR21q073ZbDg==
X-Proofpoint-GUID: Y6pf841pjUgTLMOU1zOFpqko-my0nB3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

When firmware crashes, the SDIO interrupt handler may read a
corrupted RX lookahead whose header reports more messages than
ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
as:

  HTC bundle length 2322 exceeds maximum 32
  failed to allocate a bundle: -12
  failed to get pending recv messages: -12
  failed to process pending SDIO interrupts: -12

The handler returns -ENOMEM without consuming the mailbox lookahead
or checking the firmware-crash CPU interrupt. The SDIO interrupt
therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
processes the same invalid lookahead.

Stress-test logs show that this interrupt storm can continue for
15 to 20 seconds before the firmware watchdog allows the crash
interrupt to be observed and recovery to start. RX remains stalled
and user traffic times out during this interval.

ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
A bundle count above max_msgs_per_htc_bundle is the same class of
corrupted lookahead.

Start recovery as soon as the invalid bundle count is detected so the
HIF is reinitialized instead of waiting for the firmware watchdog.
ath10k_core_start_recovery() does nothing when a recovery is already
pending, which would leave the interrupt storm running, so also mask
the target interrupts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 748ba6749339..fdf19ce4b55b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_sdio_disable_intrs(struct ath10k *ar);
+
 static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 					 struct ath10k_sdio_rx_data *rx_pkts,
 					 struct ath10k_htc_hdr *htc_hdr,
@@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 			    "HTC bundle length %u exceeds maximum %u\n",
 			    le16_to_cpu(htc_hdr->len),
 			    max_msgs);
+		ath10k_core_start_recovery(ar);
+		/* Recovery is a no-op if already pending, so also mask the
+		 * target interrupts to stop the IRQ storm.
+		 */
+		ath10k_sdio_disable_intrs(ar);
 		return -ENOMEM;
 	}
 

-- 
2.34.1

