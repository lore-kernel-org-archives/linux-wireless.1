Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065735;
	b=5IlBcK0s4T0K3yIHd2T/gBi7/XWI5aCjCI+ErJ8hZFrKI91XKRfWUUXHetsaNjy3qywF
	 ihGjNzaObS4GfRLWHreqUttb54yQLQ8pz2mfhMZKKUH1BA6cqiNWxSg9ksnDqV4f93FIL
	 11RsuFBB7jIXS9isSN4DCMk54h94XQOj3lT7ioZiFu1NGzFopWRnJMXaluVsXA1ehBNiB
	 Bcj2asJ/v+Q/3I1+EXiY2Rbzh1Lnx4FsPIf7aV8B84oSVuXPCR7um9bX5dZeRDwgy0bGi
	 8Q4QvQlvHRrsAMlmzwmPfr5biX+IIbTAJU0rQB7g37DO03Hbh/4njm7qepdQbNrKuKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065735;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CXBqLDE3adiLJl2oztbDl2MBmI11ykBZVESR0gBdFik=;
	b=xgSftWzrrCVn2rw3dJjchb4w3riM2MsGW6QhdaiOovr60nIc0qkxLno1+pJAZSmQAMfx
	 gRhLL1DtFHseQ/JXOJVE7qjMuHuocTg2K4B33vWumgB2QnLpq5wzJHUZDY36q1TbATA+X
	 zsCKlE7TVcCX4sVBvA1QgosdMqo+LvfnKWodC8zHG35QW0+rhdJwUfJk4qZLKXb7ghf4b
	 jENbCzDUVpZwEgDHF70TewlrNuey9nONDE+DKF7hY32A1VLh9CGRHZj8kVas8kgDQwZxc
	 QdaTvhVr3nLebHw+mvJwZjTL0UweniuaMqs0kSc5VjKg3b5LC1Z5MFYa4izknG3rjnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SBaJQLaY;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D1606A326;
	Thu, 19 Nov 2026 05:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SBaJQLaY
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5MAIX02037187, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795065730; bh=CXBqLDE3adiLJl2oztbDl2MBmI11ykBZVESR0gBdFik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SBaJQLaYDrbH9fkCzd2fL0aibW79ScMPKej0bTweSB+D5s8K4zL/h5e6GQOT8UpYC
	 nsPjdklJUkFYs3BRMg86x6NDRcg5LEa1PrLDAydQJ2VoL0mGyHxa0SfEr0ejfw0KcY
	 bWz1qotWUlvGfsQvIu7wkyiyTxVzyx+bRqwQAFWOvSFMzLBFE9AEveZGPi8oC2FX5b
	 65Ac+ZNSL0cZOiiGNg6wIhJhAJwXSdifjVCRVCTrP6FCdQL27PPsqga5m3mCMmmcz1
	 62tlSxW773zbM2XAI5NrKkQplDQjyLie4s37yVZbVzwsm/wBq/BRSfCtvQw/slY9mS
	 OYOFPpg2HuLjQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5MAIX02037187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:22:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:22:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:22:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Thread-Topic: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Thread-Index: AQHdEBhgIKLF4XCqRUOEqFLTRQ13TLZpIRHAgAUzM4CAxrmugIAAnW/Q
Date: Thu, 19 Nov 2026 05:22:09 +0000
Message-ID: <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com> <av5ztQNkWSsLE4NA@embed-PC>
In-Reply-To: <av5ztQNkWSsLE4NA@embed-PC>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> On Wed, Jul 15, 2026 at 09:16:09AM +0000, Ping-Ke Shih wrote:
> > Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > > Add the ID 2c4e:0124 to the rtw_8852au_id_table to
> > > > support the Mercusys MA72XH usb adapter.
> > > >
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221738
> > >
> > > Not sure why I have no permission to access this. Maybe it gets broke=
n.
> > > I'll wait a while to see if people will fix it.
> >
> > I seems that my Windows desktop can't access this link, but
> > Ubuntu is fine. I have not idea why.
> >
> > Anyway, the reporter is still not confirmed if this patch works.
> > Can you post the update here when getting acked?
>=20
> Hi Ping-Ke,
>=20
> Update on the Mercusys MA72XH (2c4e:0124) report: the bugzilla
> reporter confirmed that the adapter works with the 8852AU code path once
> the ID is present (tested with morrownr's out-of-tree driver, which has
> the ID). The earlier failure on his system came from the rtw88 DKMS
> rtw_8821au module claiming the same ID, which is unrelated to this
> patch.
>=20
> I asked him to test the mainline rtw89_8852au with the patch, but he
> hasn't responded for several weeks.

So you think I can merge this patch, right?


