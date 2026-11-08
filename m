Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123153;
	b=UT3tzXssZmHOSUXQFcllVjIny6Yr7wae6z+9+vbBM7e/erlTltcsy1YJnRXjrJs0alkq
	 z4qcsmoi0LDhnviQETW+swTWNkreQ4Hoppvin/FxOFOxUrEg7UAKSCijc8FvdeeM/QUnd
	 IQ9ZDMd5bkVn9N178ZmbjukRh+t4NgoDtXiM8qIqVVvY7JUSokieT45q2iM01NnGhbtG0
	 hwfxuikOzgREoRY+f4DNK5JnOMQPu5C2oaaRN0QOq6lIGLUN5EglQLVMZ6Du0mA2z/0LA
	 QDNtCa78M7L9BVYDax04u/GA1WU7c0kF7kAdFs4hIlcIlosqamOPFtkR8hO61cWIpzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=SGeHg2KRNfFmuAJ16qC5py6Ad2oVmNfkG9c964zpSnU=;
	b=qo0YunNUaj+/muMjUV9KVlrhHt49sDGRwLPIJQpF2unF9tJRYGCa56aPspwd3TgRmr3e
	 iqEDmv4d+W8OAT+mA1AS1rQgdePpn0T772TzxYEmKqMNc4VV59RX3iJKi5g6572xNn4ag
	 K+90rlGopYPyyExuzrJuGRRXgWWqh+50dj6ATuIJEUQ96lU8OxcNlUFgSqmoGDZqRrPMD
	 i9iquuYC/MCb7p2NHNMGo5j+vnvUpgT5qMovLL/t1tz+PKfOuInpkeysBBaW0/hzHx2tL
	 waxChwaH1+ix08cghYlVMes/JWvxhbnMVsxKwNreHr/Q4LByjLyvhjxim3fuA5yDlGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tcwb6xZl;
	arc=none smtp.remote-ip=91.218.175.2
Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999A606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9999A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tcwb6xZl
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SGeHg2KRNfFmuAJ16qC5py6Ad2oVmNfkG9c964zpSnU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794123150; v=1; x=1794727950;
 b=Tcwb6xZlTCa3hdN/leDarYox+mLbNEwDF/wbVZZ6wiN0Z5CgRtO1GW3DZ38OKfm92zvqCwLm
 wB+IOHNgFYGf+JDFdEZFoR4LX+zBlWLf8D3kRNQFQk5OFbfUrJdu6wYYcwa6cxt+/Szng7epRD7
 rjMPbtzsecnlQ0F4g+H6+Y60=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21aa3d1f887d5545;
	Sun, 08 Nov 2026 07:32:30 +0000
X-Mizu-Trace-ID: 21aa3d1f887d5545
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 07:32:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register
 values in cck_pd_set
To: "Zeshan Ahmed Nobin" <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, "Kalle Valo" <kvalo@kernel.org>
In-Reply-To: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>

Hi Zeshan,

November 7, 2026 at 7:34 PM, "Zeshan Ahmed Nobin" <zeshanahmednobin@gmail=
.com> wrote:

>=20
>=20rtw8822c_phy_cck_pd_set() indexes its tables with two values read fro=
m
> the chip, bw and nrx, without checking them first. When the chip stops
> responding, both can be out of range. Patch 1 handles bw, which goes ou=
t
> of range when an RTL8822CE drops off the PCIe bus. Patch 2 handles nrx,
> which Luka Gejak found while reviewing v1.
>=20

Do=20you mind resending this series and putting linux-kernel.vger.kernel.=
org
in the CC as well. linux- wireless@vger.kernel.org list seems to be
broken right now. Just change [PATCH] to [PATCH RESEND] and don't
change patches nor cover letter.

Best regards,
Luka Gejak
