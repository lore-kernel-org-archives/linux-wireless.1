Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528760;
	b=ffuuUQOVbSFPQQk0mD6sbJ9RO++cGa2q+2OMbhW97TTLPpRRY9zS1ebcH3g7YzkinXjP
	 QKCaLlDrJ7XqC6yR9r64fyt5fWbRSTvKIoRZBPZ+MjgTV4QZc25SjTNoOr2s2joOe+1tn
	 OAH+07zgBbATgno9pQUPSG/CP4fyPg2S52ge5suE9PMqzu32UoNqIiewexAqa+jrRjaEx
	 u+qj7AjC8VkEV9gQZ1G5anThh0gF8v6F6k6W5UVpQXbZZkPBcIqWoxWEeONecHXZ7Np9t
	 XmfxzzHd5GsotaKG22JeQBPzGc6QuQEpopeskLpk2pyeUJpE32s8KGS+ei/EaHeBrWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
	b=sDXAGRxD+i9BiU5IBXAjDv662ii65TvssJ+ope0F9wOOZvdbkAR+enDP0Ocwq3Kov1Cs
	 bx9Ee0YHA+rm7H65x4Tg7vl0F8VDpuX/DuTCpIIIxLVxVGrX/MMpYEI5Dlb2K9RPESHbP
	 YUGfmxRdGk4a/48PHzCsT/3CASsXWR533GtJby7Npfu5cn6cyLXwc0fkAB1PWEqvwsLEJ
	 bL+rdig+HgRN3sWLGsw3u1szGvzZIDDiwbyoh+5fOJeF0q4HRP2TmcpjMotiwWaj+6wvC
	 Los5EHNdPxTUaKyEUkpwcq3ooV6giBTdOKqv1yBQt51q5TQ0cqIfK+/yEPqGiQU5xDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E409606A335
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E409606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAukfj1291628
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=; b=cjon4UcjWcOCiCM8
	gWnrwDsiwp8zzMGkWAJPa9keZO2UKCWvdPbBRjeXwrgILeg8A0E6yZL/f9eCqQJy
	O96ohgLQVhZoEIEGGSYendAY0kAs4E/AMMnW7bUQvgm6QHQwOBM5GYlpnMNBqIpb
	G0+KKhKO6HwZ9cJ6SstBm1mVACHgb7ITZaNm349eAUITvyDoOK2Vhts2i71NShzZ
	aTsFDdMyLx5KEmJUoQnOJeHpgXB5N7GQrcGeLfGns3+3ypy6i0l80fMK6zj/XH4v
	ZmAfEaXUVS7MnftLthxU7ZN2TGHLRlWLMZsQMYPU16dT6qFU53GTsRU5/hGoAumG
	Y+fjhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc4rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so820150585a.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795528757; x=1796133557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=IN7Q9iD+O4F/PJc2it92D9/IjlQdp6EwM5TEPIVGAQp/v8AEcn9kZyUR/VAhDLneHt
         pdzxCFGP/NAzkGdU1isqrDhHoOxMk2h8qpS78rlgoYO8IUehw5J2N+iaPuMU3eNwEWzI
         a8o/dWwAUN6BpOZOyDZ9PvKU4PUHMoWWAy2GSsX7k1bH3Atyi61hOxt7zbzqvV1hPNy+
         zOeTFRl9M/nygxps3bdprTPVsKW1OPP619EBYe/xe+2nwlmlibFlTVrVKjCqImiYtRxa
         1nG+ztXgG/QZ660Qq3uMBEz8998p76BroN1nAbKGxFgF7/D0rdWigxIMQieNNoE9l535
         ii6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528757; x=1796133557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=x01S5HPTk0K5QC1Arh2/Lf6OVahbLxJMqVeGBWnS8Vp8RIXNrxWRxajXdf0sPfaVr/
         pndiHOSde6tjeAH/U9ltd1eqkT6db0DQ+n4nNvz1hdAhVikOsRi6uPAcq96exX3FftqW
         wpCXTvhYsbCnnkmQrH7lvJ/uBPZ2bTbkGXgulE98vwPqUc/65ok1uNTpcU6jC+u9l8eb
         +JmkRUPa88hubmww16AQQJXUy0+4RnmtiBNaWNhkB04h+l95Vmz14rnPzg6ZckwmB9oB
         3wL8s3F+pwXTVw1CWmx0ToNPF0waQsT/lsa30WffWpQsQMFTxPGxMz3qr582EVgwfLh0
         BYXg==
X-Forwarded-Encrypted: i=1; AL+hErE05aqsCjRJ6bytHDP8Q37pMSwDOcaXA1SSIJeZQE4p4Jlx4TBuJ6GC+ai3giLKMDSz5pub8/ogtnSSCefUQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLSJaSJOfKsdTH3g7tgOZirv9pUDTmrP7AkGnnowWgEDx5TQT
	Xj7I7iIY93JGQmIpC/Wbcplt3XogdSpk3ZTOoJSjotp12K/bBg+gG4pfbLPNiEk1Sy+HDgcAfUD
	t2qpSCBbRlqppW5dIxAbgPlqK4C/yc8R7QNVOTfy5hjwbj8cwZ8+HYwfS0VRFhwDjzxyovQ==
X-Gm-Gg: AZFdTZdSOjeC6gMNZEj/Irmc41JRJZMl+kJlCTcPHvd0BeIeOw/MhpwJ8/VIWzyD2yh
	IjAP0Re6BHfth4eaEChUE7sC8l8VeBWipaCXUs9NJGUoZS6yqWE9bxRWXL00bFqOsduc1WIFup8
	Cc2U+rmB1vj7UQAk+GPNDojUZH0Qr/7jE8SSqNvWgRf62atEvf185AyuKzDQUs8EJmBJzWP+EOf
	ncPRZU7gjClzR+/uU9PuvsvjjUxzl2qTP6Ll4+pFkWfhJKj39USHEE0ngPq4fY8hVVs/GW3h0Fy
	M/m8TzxYBKnrDiqBdBkxxJ2YnzKwboVoXm6fEnWfFfyKyXlwfOEAw3pfNE1jqkXnhqPKPAmFAXZ
	IYmRts3EXfnPZf8bZWGxWY13tMGf/o6+/5rsCB1zuD65EISkZXxN0guvf7JBlf1MgEzhC6W1ia+
	c1PfSok4FxLN1NZl4Hj9/Wpa4mKwwMGgtD6WLqjjA4W6m1UpztqaQXMPYj5qenwA==
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739757285a.18.1795528757523;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739752885a.18.1795528757012;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28945865f8f.48.2026.11.24.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:59:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Kent Gibson <warthog618@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Date: Tue, 24 Nov 2026 14:59:13 +0100
Message-ID: <179552875131.26219.14927804757047791549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123085723.156933-1-arnd@kernel.org>
References: <20261123085723.156933-1-arnd@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX3MD6YP/Kbc8p
 Zstf0mhe8qGEoUP78I1yB6tw+jkL2ci7rlr0spwCEF6KAUjgX40olxummBFtJ/Gb3RfDwgyysIx
 0eb3IDB0SW4FLszx/m+OGweRJ4op/uk=
X-Proofpoint-ORIG-GUID: cq1LYm7KiOrOt2pf93MgHjDA2WJf73Sf
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059836 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5VOqrEiZFYvkFkybF-sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX4QFad4wKbZVO
 T5qSvMbx0VGAmyTk7y8moei2cr/OCT3btoaZScWL+aIxW3OcLbQbHmKDnY7eyVBbaZAMAORpyRB
 +Qmkhs2jccy50EWOBopItq3LslvI/RP7C7OwBGUD6BFFyoE8emZpo/OGaSwX8QcGgqOsoUvPsy6
 MqoojyUXpxi+A3OYD/p36eNU2aJQ7j6/sWFN1kf0x+gd4eQ8yuizh81i5TXXoWzqSXR6gtdpQb5
 Eu4fzJ3LRMJq+DmDwQ7b494KPssCqvH9v8srGY1rdnlH7eEeXhe0AFP4K4xodaAUed2JUDHrjP5
 /58eP/w6QXZhAbcIgnv2p0q20ZCug26P3Bmy2frgAkG1uH2vH7lSxMQ/jyTcVwbToMQctrKTMPN
 zzLXdfN7PPHKmbwVUDi/mahiVt3uTv0C+RMX+NvVmHseGEAr1Db09/IfMHfemqnJXphZBeVSqHz
 JyprqVycwgs0BqiCmog==
X-Proofpoint-GUID: cq1LYm7KiOrOt2pf93MgHjDA2WJf73Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240054


On Mon, 23 Nov 2026 09:57:21 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two patches are left from my cleanup series, finishing off the
> work to turn off CONFIG_GPIOLIB_LEGACY by default, and removing the
> include/linux/gpio.h header.
> 
> This was planned for 7.3 originally[1], but kept conflicting with
> ongoing cleanups for the broken rsk7203 board. I've skipped the
> oneline rsk change now, which will be fixed properly by Dmitry's
> patch [2].
> 
> [...]

Applied, thanks!

[1/2] gpiolib: turn off legacy interface by default
      https://git.kernel.org/brgl/c/b52fb554b36ba37f86a591d0d27dc45fc5628920

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
