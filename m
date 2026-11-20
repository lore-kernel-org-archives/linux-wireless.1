Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164183;
	b=KOhBy9WABC482yzuEqunrvvXptpanCi2h0wWzc+Nl++kaui3sMc/QHHPnxvLV4sjYfMg
	 nldRR9vWRg4qhtjJDPjQW7bzR15snZxla2CDtTnTvGHo6uOwLETGQKJycDi/jK8Nre6cw
	 cBVnhO6BZxaq6t1MUTv+5r3M8OKJCz+mygTSoUj3utq4QnCpBX0cWtkcINGSeQeoh95pF
	 FusfXC4N8HXwej3LqM2eFdXtK13D+B4mzOFJIGY/AVGCQt7JHl8CHWUvI/64/YA+csB6z
	 ve3toFnwaMIf9X8yk2297nBF2XCqK7dcktuoYij6f9c+TqZxE+5dXDJ2UCcx53ke9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
	b=SkOYT41ohB16DZYtBR99HhTW7NjKgK7yKtT53zBdJJR7qAXQV8ePZTQbIgIppCr7xXMm
	 xLeEbrpGOCS1unbmNyPySWUGDsDhpS+Pm/6HT97NJl4jWfs0QqGf5Km9EdXWxnvTNzUTr
	 cy7+eTTEgPySt8naZUuALiIA3by8zGLZxRy0eH9EzyzR/F+qjN/6qBsksHIk1YzrF5mL/
	 4Q7dd2K8vgW/G9+aUa0IGpSNNMRQi59VbULdlXPsMDLoht38nKH3ej+YNhtf+o+Shf0j+
	 7Br0ZbTk9WTgFBcuaRmgIft1WPe7+lQjBXTY2d7Gl3HJjDAR/eOiQX4TzjxVqDINv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHX1EORn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxoeJzSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7EA606A889
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7EA606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHX1EORn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxoeJzSv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqQF1268338
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=; b=NHX1EORnDeB7UJza
	zA78agMW5kBPecBVqSsp69Imv9knGhjE+l05QQMFSYq1toKpFVt7bYCcwGfLqxHJ
	MxfSGKZ2jLdm7o9M7rGGVqPerYYV76itWAy9SXrup7utZ7x0xxpXzUpg4yS2BCgk
	k/jJpse2SMm8kSJLqKYMquD7gjb52QYWYPogcaIQyJmHSNuWqarEH+QJDfQ3rV7X
	09pgNxaOt+DdsJCAIMtCtO5Yn3Lz5sa6P7Wt4KqFAgmVqBrpRKw/nODwAasfW54T
	mx4A6wCs0lN3A7Kfrdr3HLYOq/VRpxe2DDgpNcBKJJGnfnzuHuLA11o3a0Ly11Fg
	/w0wdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sgv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so1881498eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164182; x=1795768982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=gxoeJzSveI+obu+re/wcoZs1G8uVoWtz0te0K792ahWcj9ep/9y1xG1yD6m1urWWRr
         bvjnR2daNyk+ys/J406b4R9ld91UUWXwoFJ9nKqZflc9rCLamSM/fRCp5Pn4wHHXJ/iY
         Y/P0HIfJtR1p54agMzLbFU9LK95u6n39rKbBOKlPwXnHVfexyMDk5Qar0OU0hx7EIx7i
         wO6LB1N1klTbjhzahBXuONPH2iyKs4xHgB1z7la4I+0bjNMBIj3MdDSGf0+4PxXco5OK
         /KEkybAbJ/oRFsz7yJfqqKIRDsNPN9npm40Yv3RBnV8ZfwyMq0nSggfC2Vcid+6ZPLUL
         Zc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164182; x=1795768982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=uXF9ndFva/8d3Ue1ViSSoOTxe/yVuB3U5SRRrM++ndpQvTjwMJnDRwikrPaEdjA+02
         wumERkvVgeZ5tDJlZDA2Z+FVpa/AiV5JCFnyFBv4kjHGZpVrZR9hoT1QP9HJafH3JOVk
         JwoSU08qAe17hJ4OxNczT7BRHhRWmg94XIxD/aGeDmfzhpUcnwBXbkHBlHKGMVX8bkDP
         6urVUgu31a53nvf10LAXCp1Lc/EjPvuX5d4DFl4H5FuDVdC1xSMhIE8Nfa6VfvPufFVE
         TESCaIEp7kM1vFWmYWUMmE0XRijpJmbcAN67Gayfuy6aFAZsfWp3jQVMM7N6ubSRrBFx
         7Y6g==
X-Forwarded-Encrypted: i=1; AL+hErFAEHnJKwL/YOAKQhnKuuBIYeU5Gq7ZASO4BGOqDLfVaxpzmpcBvdalaZAK/pi38i1iASW39OO60Xk6gVHrNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9//bqjj8/VmrpUY9JqJq0FMILWZGNB0I3R0FmjGsmup7vYWtwb
	tVzZ3F2uMki5DVSE20yrQmB/EwooBYWa3hJy3CjKlhTXZQ6ZaoBBWki8afur4qyH/qXAE8xGRrR
	kNr/0FPRvzJgOS+D+tGXdBiizjT+0Ci5uFnUKOst/LTEoZ7+Zs8DOjpV21nV8SBC8m6uChw==
X-Gm-Gg: AZFdTZeF4VFhe0hhKDu88h/3s3vVlINkH0uh+1sCgZbc5As2xIJolyXNCYmBd5lzOlw
	E84TS4iwrABXf4aGpa4hQWLP9Cil6xgQRcb7v/28pecgsRgcYZ1LHV9NaWmBEMjtY0ER6qn/Gex
	7pP6SLQ0hq0jIH9PG5vqaqYrUhHeDI3feeL/3t7XqbIdJMOL2UGPWRWzc0M4OXYqq00zwknEToq
	zg2waH+b1sg4PUx+R+xgMMVVYaK2Bf8ylvRSfpVcWyTkl8djOfKHg4bOe95PX8Ttem9Tjyf76v6
	pY+imyBuPq4ipYepWXcfxNRx9K5ng0wTjnBSWxL9EkWvnmgwaBMrlmQ2fHHNKi4Wtcz49bpdYcy
	TPeYzuO+49u69miSXw9ZHZV1zgDGgy/T9VFCZx8rRVXH/CEM8NFFtlRlSVYIwt7ZU/7NpJFzoZt
	mTprXXJrrfi6b8zcFOMAVPxGw=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114198eec.9.1795164182123;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114176eec.9.1795164181606;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:34 -0800
Subject: [PATCH ath-next v4 09/10] wifi: ath10k: reject scan requests while
 the device is not running
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
Message-Id: <20261120-recovery-v4-v4-9-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1791;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=jQsKbkB5iyun7y2BOXmT/QxNJpkL/SdMSLPjVlc9s6k=;
 b=gm8m30oMVR4PS6QT+wGJNAXS5+0xMygQHX+c0M2iRnz8dfDU1d27y8H3tBkmEFkm1SOU5HwKo
 qv58cg4sTXpDBOmutJmCo3JM8CnChohPXMme5NTvcsYa8eICfUeQlfR
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b000816 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rcScFlgHnXZ1OZxkjSPyaYaRkH-IIHte
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX24jouGfqVoia
 +IaRF/6VNjpyxdX8vh1UR2QgJoA+gCSOLVz1QgttxxXQQtVjAeQyaebT9fp6HqVhF2QkKebnUzT
 r0/IP6Ts3V97QI2XZp/g00qKmObBUG4HtdhXBC0uW2itoDRFr7V8XIPM6yvNheoH/3MA0uEGjDB
 2HdXM338WUM30lZ8nbTSI6ILEtxAyOnYEDlmr5rhOVtcHwv0nJZaev3Pf06PFLmQR3t6qRDt58p
 VmqVGrNbEirNGOSbBD+giEomVYjoGne81YmnilxBgZJxrGNnbMH177y0cddExKlJh3adXWOw64b
 BhXUHOsOUur9w94GxA1EWPGeMJvVH0+/9eBrbB4Gx8EQQ/WhlKxRCe0y6qvnf4upC7CmnR3U54y
 iCPbeR1wTWOA239KMQqqMu41vKKe2oa/ziwcdk2pdh+NaucF/P74SFcT163jpYgSUxiQ+Zix2UE
 rzkuq0xFxL+ctxiWbxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxr75TKku5/TM
 ozxkDtCKqbSzcTrYIM1jCaH6wzavXSQcTPv/IjOSTEdB0tgIpbmHmviEPFU7VR+O3dAlkyowtT7
 fKQvzOjXo/cBEtoLQYqueSajscwP2g0=
X-Proofpoint-ORIG-GUID: rcScFlgHnXZ1OZxkjSPyaYaRkH-IIHte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by __ath10k_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a213d8c2a8e8..5d3f331950a9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6415,6 +6415,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1

