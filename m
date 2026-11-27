Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788819;
	b=uipM9F5mUpjHh2MNfRdX8K3k83Y2PxsiCdsjALht2Tt+gNIajlejVLNegBCrFDZvg83K
	 rxOz1APjXbp0b1sqaoV/0qACLi2z1GqFa1XFZ+dqYqoioO2CWx9vdcvFZwt0c67Mpz4fu
	 Vdkp00vyrhh9wDuneUi9nnobeYh/GMu3znEo/qi+6GI34PbJYGmJw5QaNpY4oE4F0Gqnq
	 S2NY0BiZyblNtfLeJshNVw/k983gaxpmMOR0KUr/TUZjzQhJc8pFCp0qMYBUwNqGtZK5l
	 Evlv5po1/3kL7ddYfeUYh/r3ss+s4A1TM26bdviVZOtDVnS1FQHon9AngVXSxtwlcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
	b=JiGI6HfNbhn3iSHtAcAK0x9Jwjz7Fcho5hM4S50Z6LVXbKAGrWoZ3oDxDS+8kBZXLaNV
	 uKLIaepITKacrWLUs9/hUR5w491/r5kmJtCTth7QCLHRhw9ET3jSCmHcIBuOO5xc7z9ro
	 o9/kcCunoeRt4u1I1wW815Mf24D5vvXkTrDJHZxyHvvux0MDZ8/or9IGMnTrETAMgWYEW
	 CNMay2z0SjDPxxRtkR58HjHCiY7o69050Ihvc8B5V8KKN6P+KdvS6C1+i45hABx+faIve
	 TO8zE2P4X08fz/jjvt+KCecLl1Sj/rugPTm+5dlOT4cZ6z43ZZKCayONQ0hLmmDB4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLRNMgag;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A9606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLRNMgag
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso6247667f8f.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795788818; x=1796393618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
        b=nLRNMgagNLC1V6obaF3TEgSz41fPSaNzm4EtXlnUIOoRCal7yVxImW+vjmBfE9ferI
         vOOCF+q+IovrLjgavyAU23tdgnpOpofDh9cNxXH1F1rwdalZ4EYPU4LRbGY1CvYhVPfp
         gR8GmHUOfVb3aiQIYoDr6X4LRSRi+XcaZql59Yyw9AZz19ZVvnSiCxM3WD7inVB9SjQv
         4ODIkHrBnKhzJ/iiyeGNYj8Q/gFDxN2+1FHavAR7BYs5Uz/+PQVX8Y4KAlg6DGqvxubl
         48fc5wCsVPVQLph7RQUUchmMAB1M6cGHnGe5cZyKRMf9oC4xnGpAI7HrdhfC4f9HvAiR
         xgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788818; x=1796393618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/we9OmzIGIx+Haa47I705VpYoEnqSWLQ8xu/l4CLfc=;
        b=OthVV0qVauWPMM0awfjOmuj+esGkQUuctUAOjOMSgSXsa84y2qXQPJJgv6/TOxWnlv
         Lblg+5bbZufVDX5ZZb8iATmBF2JI6UkIp2DecAwX9q7X+TSSzxLp0YKQp3EC+yZkhK6g
         3as8yFrjll5pSts9M2q0ZPEqVi8YWsZvygUHYB8q5QoxofkkXdd/quqp/MnseSOKgnmS
         C0nemKexk+qhCgwBx2IsttDpTtLCSwHTxE1svqaxQQcuLYfIi/wk1hxJid/9Vtk3r//N
         dSIpw2+Pami4X9mThd86q/C5yqp4qFdijli2ctVxJwwhO/7AkRqMWDtAZfPcEjSDlLD6
         oADw==
X-Forwarded-Encrypted: i=1; AL+hErGCr/YCvCXGFr9ntMn/J1P27BdLLAE0jhHWL0l6c6JCRfth71DX6bOIBmM/Bs8Yh/m1ptzHhhd0kUTYkE5x5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JwobwJdLlzHVIqjOlCmkuGcuDofzl2Efvk71hp8l8n/Xjnwl0
	6XKeKIGwuFWO0LySFlgpUzDl0haiF6NuRx/teKSHdVZqlFUVuD9pAImX
X-Gm-Gg: AZFdTZfg9U+hBQ6kiXACOSQKNqRTfuZo8uDzUAXZVz6C4tkB9QKnAE+DFZqRbcFuwgK
	+fhsf0NYUyQRsGBuF2jQhLNZ20NJpQ/v9Q6YqXOwIPfXRVm7kk0yk+3WfzqjHhqy8HnXYCJ15WN
	w1Amp/eqj/qtZJ7Bih4To8tM7OfwXd5BVMmDWAcHKAXXotyh6qp5btWrTMYrl4lSHjjJZfds9ys
	x/nBWRyqfXzEO3ityz9sjwaKngQV62sMTGJwsqR9TfoNF8GXjpQl5QHnZyturrVHYYiOgzjyLWg
	hSZV+Zm7R9XkXhrKYUzI/lba9yJON8YbGU3XdzUEgKUDxMSObDIQFg9PNkYzkcwTnTjpuGEesyV
	tXnGp7XGbUx3ZvOI5QOIEUAG3GIJPNFYihEuk1s1QKPKdpHTK/Oa73GZCAAKz6ux+AJoCETlEQM
	LEGLjp0kCv/2tdq/ovP2fA02eXyKsAMxyEiP51jACzb1p6Zr779uCXLcACFBNXCdeRdzVvxvqR+
	mRvccHJpTY05G6HB7FxazKAHdR5aWrpsRza+0DH+L6BiydCgDPoUpiGjvzO/8k3m5s9X7FdcpTO
	3HUBK0/vyCGF5vyaQinsZfdCTFMk5oG1NoI=
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr48840653f8f.23.1795788817479;
        Fri, 27 Nov 2026 06:13:37 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45883904f8f.7.2026.11.27.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:13:36 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Fri, 27 Nov 2026 15:13:35 +0100
Message-ID: <20261127141335.1871993-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <948fc37394234af580787acbb1686ee0@realtek.com>
References: 
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

Hi Ping-Ke,

> Why did you choose this commit as Fixes? Does it should be
>
> 5c831644e1f4 ("rtw88: handle and recover when firmware crash")

5c831644e1f4 added the atomic iteration, but rtw_sta_remove() did not
sleep then: it released the macid, cleaned up the TX queues under a
spinlock and freed the mask. bcafcb959a57 added the cancel_work_sync()
of the rate work to rtw_sta_remove(), and from then on the recovery
sleeps under RCU. So I took bcafcb959a57, but please change it when
applying if you prefer 5c831644e1f4.

Mehmet
