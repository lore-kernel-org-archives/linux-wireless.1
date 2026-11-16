Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868701;
	b=BsWF1WG4q6TRib6A8lAs/PDWgTn4SU5gLZbNO68lT2lbJUL/VCrBfwpeVOGRjzqp1N3P
	 ronEyPDNeN4l6d6WsPbU/SBvZZ/f5fOdkOv+P9ZgSfQPNR8zRNSlVN4Hhx2W+QagcxS6X
	 xWdIZJPDWj82/NYs7had+FpKUEsw50qDbYJdd3Zf2IH24q0Xd9zDTlPH23ZBqldBGvUAx
	 zgKi4nLhvAwOwuRKVNTqIPL+w+OTUJc/qkHkfYag3gmNWtTe74OkUqFXbaPNRKa2Nl9Iq
	 8mn0q+nPcopXR02XC7wNRRgyKBRVLYEAyNkT08gYRoUc0un+hfs9/OkUJwIiMb0yALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=;
	b=syxXUfycGlgnsay99piF8Ai/5hKNi1ovHXeINQte8grxTcobyIhdnRKRYjbH6l77LnV0
	 EGDGvr0tQyGRz4HKw89XybWd+Uk9U0wzVS0UtYe42TnkGKujYUds1uq2EIbLWvSm6ReVB
	 Y44YZHotD5aC9A6eyLrXE7e5QYPxzMUK8En97L7XcAPJYAIpCGOMMqOiFYOjrBujOBv7l
	 qrnzo+4n7Ye9yny0m3RJcHayo9Hf1jdkKjXjO6400Y10m1d9R19M16NH/VzJIkxUHTmje
	 FX1FInWGatOWsucN/UM8XMVCflbwKf9e4fJNttX6RZt1YTiI1S4ERCcMe6vXw98MBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnIvtiDm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SCrM7ZER;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EB606A338
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 22:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953EB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnIvtiDm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SCrM7ZER
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJg9ML4147707
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 22:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=; b=pnIvtiDmuDZCPh0O
	1eGrYAs/v/Rcct1K4q5n49CELKQzEx55Kr4+IlIeqpVaKnpvQgDW92bxi2GOb2l6
	mH8jQNI9isRRjWdPV/zqciZzAbYBbIxnj5Cpyn6JGYOctIc+TTtSWgvGOFDpyUKu
	XFJh+9TOZUzQah7lCzTLvRafP7n1NNcG4z2uZuy/qyZH8UBSlGE881PYeX4uHKqP
	npqQ+gzxZVuFlTiJ5bfCOiFVgbfka0OWstvq6hcGi6k7ziy+ovkFMo9M/oZ0m/bS
	tL4KKzxoGaQtygcEnrWp2zQm5zgG5+YQ5HJUbeBEa+yG8N1zhMEQT7EAgumnBAxD
	2zL35A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f82bu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 22:38:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso2361990c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794868693; x=1795473493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=;
        b=SCrM7ZERAheQ2nOdb+dADpQs1a9QKTJ5Cy3ub4dSJXtBUXzsGaHfkZFA3kkGfb1UFW
         LWLHrFuvCbx4MKz5i6LoI6oGbDFVlZnPySMS0cfhKX2135YYFjclaS2hieBhhL7R2Sdj
         MHJZvMw22EGZl7Hu80Voll+eYALWzuTN7X2DZMN/4w58RAQLx3aWYscIZK2P8V477lCC
         1zHXvyRuC0kGfyWdjkRguY9gOSWOXRPULtS56eU+899zCrARs9dLlzkpJZt9Z9tPtg8D
         2jzHzFDo6kW9TY2meBMUC/IcHqZ7sjz+qQjQ5sIJf+uun48t8maH6qzxS5ULAoZA458x
         ITvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868693; x=1795473493;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=;
        b=tqjBY0IkqFBod7qpfSJEoiY+RCx5/inRwM+yWbRwNQ9O/FvbtCnRwj9MXx32u3+LEu
         CDuKvCKqrlP7ZnGIYLQ/plpwSw5x4l6CmjrWvJSwIvUu5L/rTUcbDAolH6AR4yAhVU2h
         DggVsdmS31msKja4L8qi/96l3BdNPyOdUmy8u7tz4PcoHz/yKMYe+vKeh5g32H7UHHug
         P80tkjbcx2EuSEOyF5JveBFzXelufY7fz44yoGiipWkbTRGg9rOuEHUzxR+syq99hMH0
         pJw3Hww8g4SeEvySEHeQdpt85NyrwaxOfi+O6C+C5hrlJx11cu0ql5eR+8esqy4OU20u
         LWkQ==
X-Gm-Message-State: APuU4Z+ImhCARUqmaQl6tl+ZQKuuF/K8uEI9dmaly6i06MNLeGwcGR27
	a0Bb34SttFeOZvoCJXS4tHEX1YKmlt6/hhw/Rl4hM4WCC1MNd8T72myo0jjgWptuhQQzv/oYAMg
	K99WRxkWcjQ3Tre5+qbt/R2A7/5nIrf9dn8DGK7EcJRi+Gdz9NvNG5ExsnkXX/gBNfP/qVo/Esc
	bvWQ==
X-Gm-Gg: AYBFou1zAqdjXckjNzR9LiwY7oKlnTexp+q7YNVm6Ef6Vj+Vvu+E71dlpZPxMsFzVjJ
	i4xjiyntKPMEWmxAbtcbVs32yyz/hWOt+pLyWDe4W6vVMYAMFB8ZSTjuIvLwsa63wvx4TUMUZut
	ZARyC7TJYg13qCDVk3fN59uuG5VFyUulwwvh0rQh2YMBNP0bp7ryrqtHr4WTRKqHhHxq3GFgjOG
	a2xXN15EkTVJaaevneKF6/SwZ1VftTZzWrnTFfvPMMLQMHtYKIGd3sP6BfJbUldJ538H2zmaCer
	fIhuvlsrlJ1d8vINzsyEvCrYLlOcFTZAHDbJz4O0a0zX1vrPy5RbEhbAdzaKwnszY9NDBi7emv5
	LbV1BVyZ479sryYsV4Hcio3HGKOBqdGaVULXO0lPi+PhNKRo1WOsZbIt5vjTSUtJCb9BMS/0HYX
	pd8seGRQQHM8WHlPqyaKLI4q3V4+M=
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr13190255c88.32.1794868693163;
        Mon, 16 Nov 2026 14:38:13 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr13190224c88.32.1794868692495;
        Mon, 16 Nov 2026 14:38:12 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56671938eec.8.2026.11.16.14.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Tomas Paukrt <tomaspaukrt@email.cz>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
References: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Subject: Re: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7
Message-Id: <179486869169.378600.14299564340172430864.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:11 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX9vo9s0hTLlZR
 BKxqTgLo/Gll6iKdNth3w91rsB98Fcs6YrhK386oYzjtKH/0tTfQ5NpkKZh0DqQqh75YRyrPhBB
 GtQyis8Uw2M5KHwYHgTaNW5XYqLdsS9em12AkHKmit30ADZZYxrdvTyvOyauuSOYai2URRqpOKB
 zFhBUtoXdwscOmV/0Fscl7UmrYmx3yBp/ci69tISkxjbccDghaNUM/CbrNjWc2ijVXEibcHwQFr
 H67zoo+eGGvqVY50gqYIrBsKmSqnf1O7aZUyWbno8gpVYlK4OvG5ee/mgC09P95YVHWXeeRRot5
 Csv93y1prwJ5cYuWDN9xqfF9TZc0sG8nyRVBxdwIn0i7X+XCI38z0CKNXrlQ6VUJiD/Om/T3/DM
 3yaiCAh8FmN+nBifA4bvBes8Hl1JWkT5IjTrohv6mxaPL4CgSlQacK8U2lTO1tFXNYOjeThH5Gt
 M4F1JPw/hWXUZB/LfaQ==
X-Proofpoint-GUID: F3Th-6DFnbLqsLx-1Zk8IWSdRvM9cwKI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX7wGqv3V5/Yty
 9tSTRKsWmQGmiVt4fOr4VKtJcKvBHiHjzrECM8aMcIi7voimP38kdm/A/ZhughYwiSq+JH0TG4y
 53/MnldTf91dYKwZ38iNAlUiCqlCbNo=
X-Proofpoint-ORIG-GUID: F3Th-6DFnbLqsLx-1Zk8IWSdRvM9cwKI
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb85d6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hpYYLnOjLEDpqvt4_78A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160090


On Thu, 05 Sep 2024 14:03:35 +0200, Tomas Paukrt wrote:
> Add hw_params for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111

Applied, thanks!

[1/1] wifi: ath10k: add hw_params for Atheros QCA9377-7
      commit: af6f1a396cfc477924d84815c5896d3638f16fbf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

