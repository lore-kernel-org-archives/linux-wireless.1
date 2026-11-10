Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292754;
	b=C/SknqgkS1oQAKPShrZH0tKqdGdLGDZA7k1OhnH6qMbuY/T/vlup3+osSuOYUykFXcmj
	 A8vr0jSL2lsZHjkO0a12AObEAHmW3fBJ7rApsg9jLJpQuRUheb0Hn+idf27nrYNp6HhiP
	 UzevfVd6QlkQGYB7qfuMwpGrPKHY7/vApFxutoHD6cJPdve6P5dnLz9KNmYMbdx5iveED
	 +YfgTzDqD115EjZGg61GAaQ2LpAzBCZ0IqrUDadA6n0lx9VJsG7qT/y0+rstWy/syMKOF
	 mGhhzNpfywxyOWVeG4Durf5/eKYUwFaZwHTloYVJegqe6c7xipvay+v/cokE2ENPdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=;
	b=bNeHbbXkX8rvv+5zJrmK+A9JgIKM58ARWNsTPY00VPPPCJlxb64S6zjlFAhr7GipBZu8
	 LvKzkMPgeVlQXI5tYKSSbDxg/mGr78QV6TtledkCG+9cgQtt1OzrOxdejwiUxnG516Z1t
	 /tOsLhdLSwz0GuN8oA4pcqKwM3Yf3R4fNxh/F26PWvh1SP+jfBiZSzpyKhYXFEeNDqe1P
	 jn+5XsI1Um8z2e2gAkldh3/b97OncRuaEvRoZtZehJed+OgdQ08S7I4TszJEEfz3MWqET
	 zye2GvDU5x92TpHzRgDpb+aTF7FRYrnWT3NXUCTxGjbwDLwmQY1cm5bhP5BNDk4Flfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKU5mAzI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBtUrNYR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C15606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKU5mAzI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBtUrNYR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A1Dn2249163
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=; b=JKU5mAzIcxFyY+O1
	3ZUmw57H5p0YG7xflLHXMkJt2O6CUENkQ9gkr5P9K584be9TuTyH+k43tAZObE6d
	/v0Wc9BjXKUl5IyRiU7TObncGnwDo/vNhVoYRIYZqYuxNN733G4cWTD9svC+UTjB
	Ch8md2txrMiG3Ves+EB7kqvzAOiq06njsTGY/esAyVaNsR72P/7vmSJDqVyP6NIP
	Is3l5LHR8LN9cDIwIM+VRpKqy3eKVabKkkBtqHOIOOZPXBoREc3f3+mNYj7ohqRo
	7KUa/wCQfWG245eW+O61WVtFrjQGRT9TmBCK+LO/EUuoxwwf1l759K1Mf2clMNHx
	znhVaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapc3jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:39:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so3161529eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292752; x=1794897552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=;
        b=UBtUrNYRJfQes/YK/drHbpSCdP+MaIMxSVhD6LJzNfFJnL1gMY2G9jKaOED3u4rKWN
         +ZFOZXWUnyjNGmTkM5JJytT4AlcGJDEMFAzB5HNqPeccSay6YdlCpat41OZkJarb7jJy
         S8FbD0ekxNDppwKgbcIxTxxtHyuzWOwAorSvnQrrtau8OnIhE2lguEe78lu9nmV29hNY
         Pb210V3Z8U1nVrglJK6aOQkKErdJ1vfGr/g0KQoKCxZlD7eEiJpvBR2Z+fLCszNZWa02
         cOcAnfGkcsK767e/1LMHsYQIRHfsdVnVMqH+2HWcJrmjMxAbCZGEbeK6GIMeK1MdRV2O
         S3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292752; x=1794897552;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEtPuaGt1jAhVQJZZHgTtX896CwZ7ri/GzuKGtUT9Z0=;
        b=XMEAK9NYOiHm0evWp2Cp0TAE1hveufU29bZT/SaGnlcJO5lvstgTmhSp8aVL6tuANI
         GqpC57nueH4LrXcqzh6Tm8mUYl0Dxp2adXbmj5fDugywj3zHo3Fg6qC+odn0a4IpqwyL
         izz08sslaznQdU/mq41MP/VMMjVZJID1f1GMa0Gv6YomMg6rNBsrzS2d4g4yYIVon6fW
         aZ/VGFQFQb2X7uftvCofoWqikyLFIJJdrC6yDGH1/OAVWwKXBAYXqADmsyChs6Mu6nRP
         VFns3XCTCxK6Go9GbhujsDs5S/k/7UKYjBIp91p6peuyazHMFfwc3wpqtGBP3qCm4SLf
         TDeg==
X-Gm-Message-State: APuU4Z+9Va6pQb2/xQHJxa5GFByLrwQlWctwkFpepMUG+wtGS28s19HS
	xz84ebA8bneAOIQYL2CYvatX3vlI1dPmqxI6zjK5dMsjyzU5fojsbjjvSRtMCS+dz8dePLa/+bJ
	aqaiyeYnA0AW2aWG6qLndN8El5e6b0UBYlzcgGQEL9CrXX/K8MhpkjOeZtpA+wTZ02I/ZBY+p9q
	qLEA==
X-Gm-Gg: AYBFou1GzMctvMc7YRqkqxdHWPM5PnxjOzaszK5xqUyP2TB7cz7t3wet4fssG7eubkD
	uFZsDyhiwBemsLF5C6EWgNTElBYwnAnvweL3doJiQbOmpzmc0noDw+0QiJg8bcWJV0gL5JWpwoj
	YKZ02IC8TSOVPh1psEvGwcWaGF8cFm3oOgRYsMj8acxSSByrLCFPkP5k6kK0olti0J0sZczfCyP
	e3kM4hQh00z7HkQHVcWoR7vLqf6cX2Xjuc01qNjA5DlrC8DeF3o2YY870of6xD34/vLEKk0qxEl
	zpwY+Sh4eS+h9LGmn/Z1N6wdOpgD2fr12k2uxGFFo1WXkeP0/e1zD60DFhet+IvgNQnzW3KwBVK
	//V0qd6eVOm57FwRWqi6C3sodeqDxERn1NFW0qFomkrn0yt2IfcyqU8yyjED0/sLNxYt1N32PJZ
	3oWaXHbQTx0OiWfg==
X-Received: by 2002:a05:701b:4554:20b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b3b6025d60mr2472557c88.24.1794292752479;
        Mon, 09 Nov 2026 22:39:12 -0800 (PST)
X-Received: by 2002:a05:701b:4554:20b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b3b6025d60mr2472519c88.24.1794292751776;
        Mon, 09 Nov 2026 22:39:11 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm4318708c88.12.2026.11.09.22.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:39:11 -0800 (PST)
Message-ID: <d70e7ded-a378-4f7b-a599-df59f27e81e5@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:09:07 +0530
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to
 resolve RX link id for all devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
 <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
 <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX7pkEDEvzgks5
 x/qiG3BQtaLpQaNnmK4sueWvllcbf82u6OEr6iSsNDU2icMYVd2yJlBafewxZVQFpHze09u9hfu
 uNgWYEB9dFfSGy1yBaYyQd10E/SXNw+NGsLYiLT18Y4FnFH8xezORdYZfqqloEhCeL/Mwd2e4/5
 u56vXKbWkyUY/sEVe+m6zEZB39oVA5LlCuePZrXQKgvCg3CT0WvJ/SqAGuemc+peeRi9xR7prOY
 VC3V7Ip+reTE9JCnZTncm8xfBf0fjRU8ulKvrppTPPekqoJRIEs/NOCf5lyRisV0MsGbpvqK+r3
 8jOqk4yWkj3NqjZs/Av6DmAnwKW4YCU1ekP2YCg5XhBbaGZgzAaC57DBzw1lvyEvCHhGpaLs2oR
 a6NXOznufVMPXMTR3P3sfz6Zbee+DkwDmk+nDOzz4sRhKZhEhGJXdywenCa+8DrxcKsU8i7gULC
 mT0ax3HI46j5Lij7Hxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX2V0sB5/PRHiF
 nPpQgSikIb4+jb24QECYVt76bOxTx1rnW2j9BwMbo5KrWRuUmneDLXg/rL+NOugiGHA8v38CybA
 SvTaKylLCFDBOXr0Pc5mIp2VEMXuCXE=
X-Proofpoint-ORIG-GUID: 6KZSOJlEhVJiz2O4zMwNiMgcpZZ4sSi_
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2bc11 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GZM-sObfk6PoSxOijBQA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6KZSOJlEhVJiz2O4zMwNiMgcpZZ4sSi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

On 11/10/2026 12:06 PM, Baochen Qiang wrote:
> 
> 
> On 11/10/2026 2:07 PM, Rameshkumar Sundaram wrote:
>> On 11/2/2026 12:08 PM, Baochen Qiang wrote:
>>> Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
>>> WCN7850") added a set_rx_link_id() op so that each device could resolve
>>> the RX link id in its own way: QCN9274/IPQ5332 index
>>> dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
>>> dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
>>> bitmap.
>>>
>>> Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
>>> devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
>>> WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
>>> link id, the RX path can resolve the link id uniformly.
>>>
>>> Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
>>> derive the link id directly from link_id_map[drv_link_id] in
>>> ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
>>> to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.
>>>
>>
>> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850") ??
> 
> hmm, not sure here, since it would need to backport the whole series which is too large
> for a stable backport.
> 


Yeah, makes sense. Let's leave out the Fixes tag.

-- 
Ramesh
