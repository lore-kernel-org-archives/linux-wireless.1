Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482799;
	b=SpHZIT2RWWAHFcHNH8apa4g5pW3gcKJbCn4T9WFWgb+KxXURbPN8631YtkBcy04vMOAY
	 Wg7/+t95ElKujucwHjUQr3plBFvGrIyFnjYASy/Q3SMdNpiGljYLaABP3knb7wdm+Xja0
	 msoKHnvuNPHv6JTC9ZUn1bpGgB+fpuSZ8A6RLisaXz+2c5Dguq3GmfbDao044IwaMJ4nB
	 WfuXbb2iXhZ1plRRtGksj56yXp3dii3hom1zI53dX1DN4sU1zGy1tMEM4HgMtA4HK1cYM
	 dc2MBr3NfsVV009c8TnHrYPof8m9mTb2qldDp0eVcQI3VTy8PeJyf096G8a8qd6DCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
	b=Nx38mm446cHie5DjlGy01TxWmvQLCH3esJ/RjraQxqi7tu36NEazL9ENJQz4DQCGBdhA
	 4XuBkBdue9tWYWmlLW/TiuZ+AeSNgUkhD4HRnTAQumK+Rup3yhXkypXA6wnPWPPDopLet
	 lYvMPkf4yJjtCBADX0CdvzhzyRj8zEsi1qkJtPmzrOEDfehmE1R0eyhuC5iz9wa5i2GQz
	 cXkYfdOn0w7hjsi6DB0wxtxFWsYk5X5rmh7vqZMR+julYfMw4xhkdZvepD2Pff2Z1rR9f
	 1QCgTRgeoDUCOAi7AgdO1jCvxLKLbOn7lWOhqR0OH/8rkSA+4cLiEDCPYKNehJeEEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b339ZTnc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAh9HRz9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D9160A3827
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D9160A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b339ZTnc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAh9HRz9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5neRU441576
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=; b=b339ZTncpo+HQRv9
	J53v0AU0ZcIZC1XgpduaVcCKcdlcZZG04lZ7NGz1hK6WqyQ6aQP+v5RbokU089cl
	seqb+9zLVStKQJnqWIV+JI6z2aP2LGwoYgOgFUj92Jq1/mYuzx0CnBz/3z0EcIky
	hQePIYFvzgEv/bs4uGk+lamJWrsnvKI9BuyJPfCT0lclm0nkq2y9lEEvD9OKftQc
	wra243Op9X3HQkcdT5z+LMMoURVX+cBEx6DxZsyupFu6trCRVSdXMU+vc09RfoZI
	NXwHKsp3eb1rop6GRNhj7I0MwIty0T6tauJ1R9jTlOzPjeQc3KDphKXpmp1Okw/k
	jXpHBQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc16y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2419225eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482798; x=1795087598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=MAh9HRz9w/jUSxipfHHiesrQNU7Td1ZyLwXgJIMgATtbAuNjGSntVqo3LBhvzdrpa3
         HAWbApNqHTUfNn41P/jD2I+NKPTYcu5Qq3G27+wPUIwOc/yGBBg9PXb9b8AcuIpHzJxR
         QaM9per3JxILZvTbRIJ5uYiMAWgE6P9r+SNXDdHNFo3l/tD4L5LAuWA3s9ntBU1Is0H/
         JztCDsp5mx6l0Fr60HSFSuZeaNNnFkVCZUVTs4cRVT9DxnQei62u8UkqaxYhBdVTw+Qa
         jUVzm1feKD6Qnhmz1lCD2cma1xjMOymxNqvwQe9cy4PlIihxaKWE6BpeTyaFDFBdEpni
         HYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482798; x=1795087598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=a5Mpxz1kfhe3qjpiilOIusZUcQkAmxB3H9B9SpohzrhlR6SQwn8p18CEnlrp3bU3Dn
         7MmQOLurlMUcaXNjRx1xhNcf2+SLdjskwvcxXfuydyMp1KsKt8m+yo/4YUY9PBc7tUbc
         i7PG6FFC7hhxCDl9fcVq//VHASfUCAFT5fSGcADv9fzSkoOztqlBHXNEOUJuv1HbLjSp
         fseyu9LOSARLeDvezoqp+8fTep3GoW1hpoYYI7WePMP8M1+jRG/HcveXGsDyQzX5eVOT
         hMqZpuh3o8VHE+PaXUVCarF134/e7A9EL+Ex2dpJXWjNttYYBrhDkdb5Lbz0NJhMv4Ws
         cZug==
X-Forwarded-Encrypted: i=1; AL+hErHiISJHdbNoU2R8HnQnmdhwAuiiFRFuVpV47WTN0W5Vo/cQTuSbqxAhJCCwT9laI0W1alc6nTFDVtz5W6briQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8l/+pvb6EWlfSfbON4OZDZHeOwjF7NSgKWi42zKVz3gr++95SH
	Dxcj8IeGWrWD0BY3ssCgVocqysREWCLf0XzRaJpqED8jGfl9sd55gT4SJdZWsC5rrutUZpM/Ke7
	WjP+pChYAgYxJ0/Hzutoe2Kn8o2wWF7fgXd7x7Du+xVsRnFc8GO2HZSkpKlun6bj6y/qg5gOcEZ
	4iMqBDo3w=
X-Gm-Gg: AYBFou23w3p66ggn8kmnDZlT9M/N7irJEVQbBrZ1T0VaY2gbQzbrm5wzOk6Lk3AWOP8
	/QCKJXAOa8FAP+e0GCDgVr23w8893I/Tf7Mb4YTGRYXiCWfBmJ66FXUFhnzDmxT1Z3wif707e/J
	ZY/yM+kHbRQB6pO1AQEZJ+lCMt4OgjL+QmU9ORh4LfoaG//XODtbt0vSgDn0YAP7Nld3mCUfHyx
	dab9dlP23umWoW3Altb+PLluBI4I0Wa9mId5VeS2qAtqA1uoXIKx8sQtCNVU/VoL0745i0qWlHy
	D735Dnb2g2VPHux465ijA4wa83+/XMKP9WAkEsfxC8wOJ/gUqn9pAfvIYsh1vZyAg5QYl+txY8p
	XLQMOLNE2a9WPZAj4k9pGImVM71FFl1PWUVI/HI1Sw1PZwgLPWraXic4iEj41CzBwC28ld+zuwV
	FAZG1HAbD3N+T1+lDlTA/Z7jay
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987907eec.11.1794482797828;
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987859eec.11.1794482796989;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:07 -0800
Subject: [PATCH ath-next v3 08/10] wifi: ath10k: trigger recovery on
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
Message-Id: <20261112-10k-sdio-crash-v3-8-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=2516;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=fsIi1wDRKBpErglutX/2tf+wxeQ+MsUAjY482x6TBZ0=;
 b=L8F4BBjI5oGSYV64y89lnThhjuR+8x7M4gCTctaO2sWkD5L7B2FTLoU08HZQgcC0tC73IzxnB
 VrWBzCIxwajCy2omj11StHaogtB29+lSMYn2RChW2CzJ1JlwaV/ZFxI
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: JnVOt05mXbWIymAZ0yDaBKLqg9b4xQ1d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwS+EJXlUrgdr
 wN/d2CeeR36x8Q5yrW0JmwLKjOAkVpB/eoKEOSLSX+RsR/mV7l8J/vUrBND3OGeK0r8B+sLmdRl
 PQxKmmOihelP5ZPp+IfTINtwJJAsmd0=
X-Proofpoint-GUID: JnVOt05mXbWIymAZ0yDaBKLqg9b4xQ1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX5JuBZ7Jb0t1a
 B2siAVNkqZPD+8VCWdwH64hF/cYuA9Nf3ejcsYvzBQGSKsZecTqVB59TcpPvNlltHrTGQlLWeGt
 Z8XpM2L6UewI2ce7o+i2iH1wSL95WjWtYSzGiVkAquDOzz8h83dGysAKOXcTFwbvVEw3aJnsSeq
 4qs+h6jxkSfTCB2tSu2raPFpN7ImTiPC01Kg4/etCPBKO6cJI2YQ9IIGRdUUfB/zQoqNltLY80w
 MvszZRs2lH38Zb82Zg4b5xGa7qE3uG3/7/db8C50QcrCPRgQ5PBvvL52DZeSt5A55MiGV5hPo/G
 vZ0S8rfw1D4KjzWudTibqg6xlCZPH0tHxp2SnKE5B5wMiS5GyeFvLa5uBcBR1JjRJvBxe4DmSzv
 RAU8JvpspJLBUiLRjDXDSdAjinnctwzzYQcAMF/u2cF9ijeK5VlZQ4AyXilRvnGluDUJ23UXEjd
 t+0Xw9QPu3DPDgag0Dg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5a26e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

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

Mask the target interrupts immediately when the invalid bundle count
is detected, then start recovery so the HIF is reinitialized instead
of waiting for the firmware watchdog.

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

