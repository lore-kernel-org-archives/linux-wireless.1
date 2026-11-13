Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582301;
	b=MWA1ft/q2hiDY5MyByu2l+VKBmaf9EdUHfzctlIaxIx3MdcNp6FKe2ww9VvNpFFPW7qh
	 tonF/HR63Nh8QQZjHkap0fbFAkzZjjIGDSEHVzlg0K38szDizZT3fz0KNnIgFxcSVQo2d
	 bnJttRRNA4zmvpV8B/IpSRMfzhNBQfC8tendxr3NB2BNfkauIFLMtT8bzf9oKCsM5x0Uz
	 oxQ0PF0tOYMxkYoPVQ7sqdQGIAwcsXRUqOFKCe3odDZ7QNBzR21P7l1vwVR0TIUyDova+
	 qgeuEyNaninBW6CRydq4hWg+1++py7bCrh66lJau7dLhIBRc95I1tHYMH6HxWpUfmVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
	b=WxkE1p5z9rgUtIjcfyJxlzYo7YXzDgvLbDWzfq9xiqijYB2zP8GLbQz/PXwL5/+9WGHL
	 t+sXLqhDqr0z3ur7oJz/zYOiDmPVr5vbdnx4ckK4E6STHfDfkKZbAZy/i6wGkq7XqUBPB
	 1d1e//2+XQv0ZcqvXTTcni6uQLy2+s47pomXUJaNjLuXLo/4J7Edg5ulYDK7ndBO61U+Z
	 MznaH7QewkcgWTajY5VvMDUoJrciak4ojsk/Zxbjzq3uV4ztZOjwtRAUjb7/mcqyWwzdo
	 qFk4w9spQFgqYlxv0R50sUjJM8uHPZCr6ovovStvV7AWzePwJ/ujMpRjtA4+B+DJvCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai2JN6Wg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b3jvtKD3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0140606A882
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0140606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai2JN6Wg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b3jvtKD3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKPT43126266
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=; b=Ai2JN6Wg6D5WPmv8
	r/3AltXCMnS5XmB7sVjWFHvOwG7pnZoQTJxCBDln5vN7b8MglhD4UKxxGJY62WGM
	mXPlYWwoBJbqSQplVl4aJdQuGnXubcQBjuRzxsEKOxRrpUTWfv0LBdixd2YpAp7Z
	b03GM1lOze/nnzt6IqDSiNHyUrxM02ynp7EmWqx9ECgmAvFluOec52+W3FctGrcz
	LBDSYX+ufXfhJ7jxuiGCy3Hu20O7fzUbAeY0q5ZkCcPaTlx17OnWHoMCjeYgPVnO
	EWCkuK4g7Al79PUND7wIYXkq3mZRjzL8S7gNiSJrJy7EW4pi5h715PyeOjZuDQSf
	Lfe6pw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcj38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:04:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so798625b3a.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582299; x=1795187099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=b3jvtKD3K6MQYEDyWs9H4d2LWci0eGpm49rOx4H2UCCzJzQiz8eyG5Cq+IE06tIod5
         YSDrciDapd/U8CStKXUDYmcO01ewQMj4wyTebBOD1NKDJ6+8XJ4qeTAOElMoiomGcmQR
         J7HZbFt82eNhPXSXsX7lpsPTF+ML8+Hj0+swCij08yhdRq5rBzBmDKnPQLUTsYX4NAob
         h17+/yigCRF8kYGTM9RcY4oalZ39aUsVy0IcDhwhOb1j+W87OrQX82WNCPyI4MCpEbWo
         Zucr3i2DC2ztBk09g1hRUXrYgH6pGxNL6y8NmuhdmcrFzSygY5Ui1ens+epd19wz0T8x
         B/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582299; x=1795187099;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfsGkFoCvw5Z3mmB7OlXO2ikw4/sUz2q7CxAknfxV6M=;
        b=NBBGuBYCNJ6em5gib4w0O3GPiagn5C8rPBiwEvefd9H2Ejp0wxXJ7QDYc4VVQtyIgX
         Px45nbJkqjxqKu6I34MnRqgrF4kXSXOtJyJWgH63Gw25/sPADrpqDQrFRxGEGZj95oiP
         0dy5O71vaYMaX4+zrs90SFURfFjIqWmnLgOtdzGkyemXdMO0YdqZH9gj8KxiEYoVmQQG
         1srNrpvrdflIECMuPv3MWgUSWNCuGmv8EaGLtaKGc3eqlqo5uh0FkB18SGpYM2p4OFUC
         /6q+dGPOxhFIwG7QGjOpkKzR128meFItaE9ACGINzFOgP/O0ccMz73NE+CSy1wU3B6Ms
         drJw==
X-Forwarded-Encrypted: i=1; AL+hErEIJ2mWsQosfRSyt29kARhHH/mN63mSXzyaDWsBuFfzvZJMB4V//fwNy2iedFA386lopkU2uuqyXN+KDCM+6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z++Zmet6BQbEKuSWLs825PZH9ayyWTIaKYiruDCMuMJsZshL+bP
	yRbi28Ptd6513Qs0r7sIaS4UNHpv73vSEB5LFQzglZTL8ywZ4WkjVL851dc7B1BI9TpzUQwsaax
	h6Nxtk7mJOdo5/VEVtStEKDqGuZoTON14ZRmm3Zdg6mu9Q7Fyt+uqm1IgNHIDUkLnz6EvYN1wUq
	K/Gg==
X-Gm-Gg: AYBFou0jJDNhQKMrEpweR4W7177vgBgD/9DGbD1+lBFWI4ROEKpo7+DthRGDKcnS1qG
	WGFdUJbXCumWfTjVSdBiQDnADR5dMcmS7tz2mWDxXQOiKBoRv5snTE6gqApbi5xZL8yEXxgjTGw
	TXLRzgVWoTpPpy7zvlxR+oshtZYdDFFD+meKseHUXbVeYqLM7W09uPNc7riey2tvuXAyPNT9Fvo
	8mic0Az3aWoO9GUJE4pwV3IS1rZ1Pn/ADMY5FDK7vxa7bKHSWkVrrtjWKSy1129JVfrJxk5V0LK
	fTBY65YNmQ08WTTLp1y5wf2EJqKL1LR4/D1Oxhxubp1QmbICTTA1/E8QSbNcp6Z8SmfxSNhl1kQ
	KP+30L9nJCdxnvHi2HcLuhy5n5WthXKYsUz+wYKpJxAhZa/CXmYmK/5vAC50o8PdCiyUK2RdVwJ
	5Mhk+x0W6yA06CMjYp3N1QDcEtTng=
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808142b3a.5.1794582299114;
        Fri, 13 Nov 2026 07:04:59 -0800 (PST)
X-Received: by 2002:a05:6a00:94e3:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8beb1dea1fdmr2808105b3a.5.1794582298485;
        Fri, 13 Nov 2026 07:04:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243ffb6sm1252199b3a.43.2026.11.13.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Shunsuke Nagashima <shunsuke@nagashi.ma>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx
 completions
Message-Id: <179458229712.913702.1338158233604985110.b4-ty@b4>
Date: Fri, 13 Nov 2026 07:04:57 -0800
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
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af7271c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ALV8Qg0lGWWfAH_4w1oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Mu51-fs8XUHwZtewoBl3DCQi5zFqdRl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX54AiccONnPXO
 N+Jez+V3zzTrB3NtH3MNV8mKAqmIoTtWKLs6LImGsoTiaGMVPAfz3eo+Nbxo01oz1ojGn58lKTs
 9U7I8iK0U/7WZJrTVNOYaZrJREyE2Yi4jb4ked07h3+nkOWmB3+n1kuACNiyh1Jzw0NDAPFu4qt
 73L4JwxBXwyFlmOVMYhIKVtFXb+lyFNdxV90C1PZnCRgXQprTdkc4j3fIfzaJy2TwUtJptvRhNf
 u0/xm2arVuNhqtShl2Se/TrU5ufxTb+GCDdFrJeIZuvt2BBjVeoqUbDbmhSy2DHeNefk+HVNxU6
 EwKdAC+RfL06HdAEohcazp4iSHYGQgkA1xP8x7AKjEWK7c9JOLgdFTcIXcFD1k5d+JzcCeXZIaO
 u4gscEakVmceRwtoS9YzBRst5suhxOXUKp5J7ksxkb1UJ6rorF7uI2v7U0Ci+YQshygpLZmZWZa
 a9ieQ0dgfrpz3yGyQFA==
X-Proofpoint-ORIG-GUID: Mu51-fs8XUHwZtewoBl3DCQi5zFqdRl3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX357A2ged8N0T
 +t3bFLUQ8CwovDRDiWs1BhcZvvITxfiRTzakrSk865Y34Y59C5G2i5I9m5AeNUpkKHMeqxLFq7W
 DVng3oE1+KmJCA8PQgTalMVWIXec6Qs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130060


On Sun, 27 Sep 2026 21:10:53 +0900, Shunsuke Nagashima wrote:
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
> 
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix status of bundled mgmt tx completions
      commit: 51222df62c7af2f0f11ec25c9fa8bcaa0f87fac8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

